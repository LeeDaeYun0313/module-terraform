resource "aws_route_table" "ldy_natgateroutetable_a" {
  vpc_id = aws_vpc.ldy_vpc.id
  route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_nat_gateway.ldy_natgate_a.id
  }
  tags = {
      Name = "ldy-nga-rta"
  }
}

resource "aws_route_table" "ldy_natgateroutetable_c" {
  vpc_id = aws_vpc.ldy_vpc.id
  route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_nat_gateway.ldy_natgate_c.id
  }
  tags = {
      Name = "ldy-nga-rtc"
  }
}