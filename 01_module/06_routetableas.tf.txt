resource "aws_route_table_association" "ldy_rtas_a" {
  subnet_id      = aws_subnet.ldy_puba.id
  route_table_id = aws_route_table.ldy_rt.id  
}
resource "aws_route_table_association" "ldy_rtas_c" {
  subnet_id      = aws_subnet.ldy_pubc.id
  route_table_id = aws_route_table.ldy_rt.id  
}