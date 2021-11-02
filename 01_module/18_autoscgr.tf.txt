resource "aws_placement_group" "ldy_pg" {
    name = "ldy-pg"
    strategy = "cluster"
  
}

resource "aws_autoscaling_group" "ldy_autogroup" {
    name = "ldy-autogroup"
    min_size                    = 2
    max_size                    = 8
    health_check_grace_period   = 300
    health_check_type           = "ELB"
    desired_capacity            = 2
    force_delete                = true
    launch_configuration        = aws_launch_configuration.ldy_lacf.name
    vpc_zone_identifier         = [aws_subnet.ldy_puba.id,aws_subnet.ldy_pubc.id]

}
