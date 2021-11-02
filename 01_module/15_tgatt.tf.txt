resource "aws_lb_target_group_attachment" "ldy_lbtg_att" {
    target_group_arn        = aws_lb_target_group.ldy_lbtg.arn
    target_id               = aws_instance.ldy_weba.id
    port                    = 80
    
}