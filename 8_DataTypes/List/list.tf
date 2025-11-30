provider "aws" {}

variable "list" {
  type = list(number)
  default = [1,2,3]
}

output "list" {
  value = var.list
}