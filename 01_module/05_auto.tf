resource "aws_ami_from_instance" "ldy_ami" {
#  count          = "${length(var.public_s)}"
  name               = "${var.name}-ami"
  source_instance_id = aws_instance.ldy_web.id
  depends_on = [
    aws_instance.ldy_web
  ]
}

resource "aws_launch_configuration" "ldy_lacf" {
#  count          = "${length(var.public_s)}"
  name                 = "${var.name}-web"
  image_id             = aws_ami_from_instance.ldy_ami.id
  instance_type        = var.instance
  iam_instance_profile = var.lacf_iam
  security_groups      = [aws_security_group.ldy_websg.id]
  key_name             = var.key
  user_data            = <<-EOF
                                #!/bin/bash
                                systemctl start httpd
                                systemctl enable httpd
                                EOF 
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_placement_group" "ldy_pg" {
  name     = "${var.name}-pg"
  strategy = var.pg_strategy

}

resource "aws_autoscaling_group" "ldy_autogroup" {
 # count          = "${length(var.public_s)}"
  name                      = "${var.name}-autogroup"
  min_size                  = var.auto_min
  max_size                  = var.auto_max
  health_check_grace_period = var.auto_healthcheck_grace_period
  health_check_type         = var.auto_healthcheck_type
  desired_capacity          = var.auto_desired_capacity
  force_delete              = var.auto_force_delete
  launch_configuration      = aws_launch_configuration.ldy_lacf.name
  vpc_zone_identifier       = [aws_subnet.ldy_pub[0].id,aws_subnet.ldy_pub[1].id]

}

resource "aws_autoscaling_attachment" "ldy_autoattach" {
#  count          = "${length(var.public_s)}"
  autoscaling_group_name = aws_autoscaling_group.ldy_autogroup.id
  alb_target_group_arn   = aws_lb_target_group.ldy_lbtg.arn

}
