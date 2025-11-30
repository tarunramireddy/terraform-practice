provider "aws" {
  region = "us-east-2"
}

resource "aws_iam_user" "id" {
  name = "developer${count.index}"
  count = 3
}

output "user" {
  value = aws_iam_user.id[*].name
}