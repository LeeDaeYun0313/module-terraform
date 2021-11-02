resource "aws_lb" "ldy_lb" {
    name                = "ldy-alb"
    internal            = false
    load_balancer_type  = "application"
    security_groups     = [aws_security_group.ldy_websg.id]
    subnets             = [aws_subnet.ldy_puba.id,aws_subnet.ldy_pubc.id]
    
    tags = {
        Name = "ldy-alb"
    }


}