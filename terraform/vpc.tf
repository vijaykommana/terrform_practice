resource "aws_vpc" "main" {
  cidr_block = var.aws_vpc
  tags = {
    Name = "main"
  }
}