resource "aws_ami_from_instance" "ldy_ami" {
    name                = "ldy-ami"
    source_instance_id = aws_instance.ldy_weba.id
  depends_on = [
      aws_instance.ldy_weba
  ]
}