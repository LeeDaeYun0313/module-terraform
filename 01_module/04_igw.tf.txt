resource "aws_internet_gateway" "ldy_igw" {
  vpc_id = aws_vpc.ldy_vpc.id

  tags = {
      Name = "ldy-igw"
  }
}