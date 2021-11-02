resource "aws_route_table_association" "ldy_ngartas_a" {
    subnet_id = aws_subnet.ldy_pria.id
    route_table_id = aws_route_table.ldy_natgateroutetable_a.id
}
resource "aws_route_table_association" "ldy_ngartas_c" {
    subnet_id = aws_subnet.ldy_pric.id
    route_table_id = aws_route_table.ldy_natgateroutetable_c.id
}