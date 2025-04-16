#Step1 : create a VPC
resource "aws_vpc" "myvpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
      Name = "MyTerraformVPC"
    }
}

#Step2: create a Public Subnet
resource "aws_subnet" "PublicSubnet" {
 vpc_id = aws_vpc.myvpc.id
 cidr_block = "10.0.1.0/24"
  tags = {
    Name = "PublicSubnet1"
  }
}


#Step3: Create a Private Subnet 
 resource "aws_subnet" "PrivateSubnet" {
 vpc_id = aws_vpc.myvpc.id
 cidr_block = "10.0.2.0/24"
 tags = {
    Name = "PrivateSubnet1"
  }

}


#Step4:  Create IGW
resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.myvpc.id
  tags = {
    Name = "IGW"
  }
}

#step5:  Route Tables for Public Subnet
resource "aws_route_table" "PublicRT"{
    vpc_id = aws_vpc.myvpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }
    tags = {
    Name = "PublicRouteTable"
  }
}

#Step7: Route table association public subnet
resource "aws_route_table_association" "PublicRTAssociation" {
    subnet_id = aws_subnet.PublicSubnet.id
    route_table_id = aws_route_table.PublicRT.id
     

}


#Step8: security Group 
resource "aws_security_group" "sg" {
  vpc_id = aws_vpc.myvpc.id

  ingress = []
  egress  = []
  tags = {
    Name = "securitygroup_myvpc"
  }
}

#step9: EC2 Instance
resource "aws_instance" "mytfinstance" {
  ami = "ami-00a929b66ed6e0de6"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.PublicSubnet.id 
  vpc_security_group_ids = [aws_security_group.sg.id]
  
  tags = {
    Name = "tf-myInstance"
  }
}
