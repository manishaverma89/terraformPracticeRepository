#Output for Seurity Group ID
output "aws_securitygroupid"{
  value = aws_security_group.sg.id

}

#Output for  VPC ID
output "myVPCid"{
    value= aws_vpc.mytf_vpc.id 

}

#Outputs for Public Subnet ID
output "publicsubnetid" {
     value = aws_subnet.public_subnet.id
}

#Outputs for Private Subnets ID
output "privatesubnetid" {
     value = aws_subnet.private_subnet.id
}

#output for Private Instance ID
output "privateinstanceid" {
     value = aws_instance.mytfprivateinstance.id
  
}

#output for Public Instance ID
output "publicinstanceid" {
     value = aws_instance.mytfpublicinstance.id
  
}
