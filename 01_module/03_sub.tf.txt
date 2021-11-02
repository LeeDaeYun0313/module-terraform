# 가용영역 a의 Public Subnet
resource "aws_subnet" "ldy_puba" {
  vpc_id =  aws_vpc.ldy_vpc.id
  cidr_block = "10.0.0.0/24"
  availability_zone = "ap-northeast-2a"
  tags = {
    Name = "ldy-puba"
  }
}

# 가용영역 a의 Private Subnet
resource "aws_subnet" "ldy_pria" {
  vpc_id = aws_vpc.ldy_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "ap-northeast-2a"
  tags = {
    Name = "ldy-pria"
  }
}

# 가용영역 c의 Public Subnet
resource "aws_subnet" "ldy_pubc" {
  vpc_id = aws_vpc.ldy_vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "ap-northeast-2c"
  tags = {
    Name = "ldy-pubc"
  }
}

# 가용영역 c의 Private Subnet
resource "aws_subnet" "ldy_pric" {
  vpc_id = aws_vpc.ldy_vpc.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "ap-northeast-2c"
  tags = {
    Name = "ldy-pric"
  }
}

resource "aws_subnet" "ldy_pridba" {
  vpc_id = aws_vpc.ldy_vpc.id
  cidr_block = "10.0.4.0/24"
  availability_zone = "ap-northeast-2a"

  tags= {
    Name = "ldy-pridba"
  }
}

resource "aws_subnet" "ldy_pridbc" {
  vpc_id = aws_vpc.ldy_vpc.id
  cidr_block = "10.0.5.0/24"
  availability_zone = "ap-northeast-2c"

  tags= {
    Name = "ldy-pridbc"
  }
}