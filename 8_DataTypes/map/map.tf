provider "aws" {
  region = "us-east-2"
}


variable "map"{
    type = map 
    default = {
        "key1" = "value1"
        "key2" = "value2"
        "key3" = "value3"
    }
}

resource "aws_instance" "demoMap" {
  ami = "ami-025ca978d4c1d9825"
  instance_type = "t2.micro"
  tags = var.map
}