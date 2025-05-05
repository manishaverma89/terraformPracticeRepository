#Elastic IP for NAT Gateway
resource "aws_eip" "nat_eip" {
  vpc = true
  depends_on = [aws_internet_gateway.igw]

  tags = {
    Name = "NAT Gateway EIP"
  }
}

# mytf_vpc NAT Gateway for VPC
resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id = aws_subnet.public_subnet.id      #public subnet id as NAT gateway itself need internet access first
  
  tags = {
    Name = "mytf_vpc NAT Gateway"
  }
}

# Route Table for Private Subnet
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.mytf_vpc.id

  route {
      cidr_block = "0.0.0.0/0"
      gateway_id =  aws_nat_gateway.nat.id
      
  }

  tags = {
     Name = "Private Route Table"
  }
  
}

# Association between Private Subnet And Private Route Table
resource "aws_route_table_association" "PrivateRT_Association"{
  subnet_id = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.private_rt.id
}
  
