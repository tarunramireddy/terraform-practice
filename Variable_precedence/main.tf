provider "aws" {
  region = "us-east-2"
}

resource "aws_security_group" "sg_1"{
    name = "sg_1"
    description = "sg_1"
}

resource "aws_vpc_security_group_ingress_rule" "ssh_rule" {
  security_group_id = aws_security_group.sg_1.id
  cidr_ipv4         = var.cidr
  from_port         = var.ssh_port
  ip_protocol       = "tcp"
  to_port           = var.ssh_port
}

resource "aws_vpc_security_group_ingress_rule" "ftp_rule" {
  security_group_id = aws_security_group.sg_1.id
  cidr_ipv4         = var.cidr
  from_port         = var.ftp_port
  ip_protocol       = "tcp"
  to_port           = var.ftp_port
}

resource "aws_vpc_security_group_ingress_rule" "app_port" {
  security_group_id = aws_security_group.sg_1.id
  cidr_ipv4         = var.cidr
  from_port         = var.from_app_port
  ip_protocol       = "tcp"
  to_port           = var.to_app_port
}