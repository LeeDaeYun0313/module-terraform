//auto스케일링과 lb 붙이기
resource "aws_autoscaling_attachment" "ldy_autoattach" {

    autoscaling_group_name = aws_autoscaling_group.ldy_autogroup.id
    alb_target_group_arn   = aws_lb_target_group.ldy_lbtg.arn
  
}

//확인해보면 lb 대상그룹에 인스턴스 3개가 붙어 있어야 한다.