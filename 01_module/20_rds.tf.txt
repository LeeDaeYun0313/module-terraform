resource "aws_db_instance" "ldy_db" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t2.micro"
  name                 = "mydb"
  identifier           = "mydb"
  username             = "root"
  password             = "It12345!"
  parameter_group_name = "default.mysql8.0"
  availability_zone    = "ap-northeast-2a"
  db_subnet_group_name = aws_db_subnet_group.ldy_db_group.id
  vpc_security_group_ids = [aws_security_group.ldy_websg.id]
  skip_final_snapshot  = true
  tags  = {
      name = "ldy-mydb"
  }
}

resource "aws_db_subnet_group" "ldy_db_group" {

  name = "dbgroup"
  subnet_ids = [aws_subnet.ldy_pridba.id,aws_subnet.ldy_pridbc.id]
  tags  ={
      Name = "dbgroup"
  }
}