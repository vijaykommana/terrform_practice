resource "aws_eip" "nat1" {
  domain = "vpc"


  depends_on = [aws_internet_gateway.gw]
}
resource "aws_eip" "nat2" {
  domain = "vpc"


  depends_on = [aws_internet_gateway.gw]
}