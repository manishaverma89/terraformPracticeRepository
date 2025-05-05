#Step1 : create a VPC
resource "aws_vpc" "mytf_vpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
      Name = "MyTerraformVPC"
    }
}

#Step2: create a Public Subnet with default Route to the Internet Gateway
resource "aws_subnet" "public_subnet" {
 vpc_id = aws_vpc.mytf_vpc.id
 cidr_block = "10.0.1.0/24"
 map_public_ip_on_launch = "true"        #If you want to create a Public subnet,it will be True
 availability_zone = "us-east-1a"
  tags = {
    Name = "Public Subnet1"
  }
}


#Step3: Create a Private Subnet with default route to the NAT Gateway
 resource "aws_subnet" "private_subnet" {
 vpc_id = aws_vpc.mytf_vpc.id
 cidr_block = "10.0.2.0/24"
 map_public_ip_on_launch = "false"        #If you want to create a Private subnet,it will be False,ther will be no public ip
 availability_zone = "us-east-1a"

  tags = {
    Name = "Private Subnet1"
  }

}


#Step4:  Create IGW
resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.mytf_vpc.id
  tags = {
    Name = " My Terraform IGW"
  }
}

#step5:  Route Tables for Public Subnet
resource "aws_route_table" "public_rt"{
    vpc_id = aws_vpc.mytf_vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }
    tags = {
    Name = "Public Route Table"
  }
}

#Step7: Association between Public Subnet and Public Route Table
resource "aws_route_table_association" "PublicRT_Association" {
    subnet_id = aws_subnet.public_subnet.id
    route_table_id = aws_route_table.public_rt.id
     

}


#Step8: security Group 
resource "aws_security_group" "sg" {
  vpc_id = aws_vpc.mytf_vpc.id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }


  tags = {
    Name = "securitygroup_myvpc"
  }
}


