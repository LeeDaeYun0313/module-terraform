resource "aws_lb_listener" "ldy_lblist" {
    load_balancer_arn       = aws_lb.ldy_lb.arn
    port                    = 80
    protocol                = "HTTP"

    default_action{
        type                     = "forward"
        target_group_arn    = aws_lb_target_group.ldy_lbtg.arn  
        
    } 
}