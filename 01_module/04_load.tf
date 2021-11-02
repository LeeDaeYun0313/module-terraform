resource "aws_lb" "ldy_lb" {
  name               = "${var.name}-alb"
  internal           = var.load_internal
  load_balancer_type = var.load_type
  security_groups    = [aws_security_group.ldy_websg.id]
  subnets            = [aws_subnet.ldy_pub[0].id,aws_subnet.ldy_pub[1].id]
  

  tags = {
    Name = "${var.name}-alb"
  }
}

resource "aws_lb_target_group" "ldy_lbtg" {
  name     = "${var.name}-lbtg"
  port     = var.http_port
  protocol = var.prot_HTTP
  vpc_id   = aws_vpc.ldy_vpc.id
  health_check {
    enabled             = var.health_enabled
    healthy_threshold   = var.health_threshold
    interval            = var.health_interval
    matcher             = var.health_matcher
    path                = var.health_path
    port                = var.health_prot
    protocol            = var.prot_HTTP
    timeout             = var.health_timeout
    unhealthy_threshold = var.health_unhealthy_threshold

  }
}

resource "aws_lb_listener" "ldy_lblist" {
  load_balancer_arn = aws_lb.ldy_lb.arn
  port              = var.http_port
  protocol          = var.prot_HTTP

  default_action {
    type             = var.lb_listner_action_type
    target_group_arn = aws_lb_target_group.ldy_lbtg.arn

  }
}

resource "aws_lb_target_group_attachment" "ldy_lbtg_att" {
  target_group_arn = aws_lb_target_group.ldy_lbtg.arn
  target_id        = aws_instance.ldy_web.id
  port             = var.http_port

}
