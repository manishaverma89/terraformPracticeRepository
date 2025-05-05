# EC2 Instance in Public Subnet
resource "aws_instance" "mytfpublicinstance" {
  ami = "ami-00a929b66ed6e0de6"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.sg.id]
  key_name = aws_key_pair.my_key.key_name
  associate_public_ip_address = true
  tags = {
    Name = "tf-PublicInstance"
  }
}


# EC2 Instance in Private Subnet
resource "aws_instance" "mytfprivateinstance" {
  ami = "ami-00a929b66ed6e0de6"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.private_subnet.id
  vpc_security_group_ids = [aws_security_group.sg.id]
  key_name = aws_key_pair.my_key.key_name                          
  associate_public_ip_address = false
  tags = {
    Name = "tf-PrivateInstance"
  }
}

