provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "first_ec2" {
    ami = "ami-025ca978d4c1d9825"
    instance_type = "t2.micro"
    security_groups = [aws_security_group.sg_automated.name]
    tags = {
      Name = "automated_ec2"
    }
}

resource "aws_security_group" "sg_automated" {
  name = "sg_automated"
  description = "Automated Security Group for automated ec2"
}

resource "aws_vpc_security_group_ingress_rule" "inbound_rule" {
  security_group_id = aws_security_group.sg_automated.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 100
}

resource "aws_vpc_security_group_egress_rule" "outbound_rule" {
  security_group_id = aws_security_group.sg_automated.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol = -1
}

output "publicIp" {
  value = aws_instance.first_ec2.public_ip
}