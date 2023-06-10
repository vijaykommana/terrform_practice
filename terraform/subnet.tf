resource "aws_subnet" "public1" {
  cidr_block        = "10.0.0.0/24"
  availability_zone = "ap-south-1b"
  vpc_id            = aws_vpc.main.id

  tags = {
    Name = "public1"
  }
  depends_on = [aws_vpc.main]
}
resource "aws_subnet" "public2" {
  cidr_block        = "10.0.2.0/24"
  availability_zone = "ap-south-1a"
  vpc_id            = aws_vpc.main.id

  tags = {
    Name = "public2"
  }
  depends_on = [aws_vpc.main]
}
resource "aws_subnet" "private1" {
  cidr_block        = "10.0.4.0/24"
  availability_zone = "ap-south-1b"
  vpc_id            = aws_vpc.main.id

  tags = {
    Name = "private1"
  }
  depends_on = [aws_vpc.main]
}
resource "aws_subnet" "private2" {
  cidr_block        = "10.0.8.0/24"
  availability_zone = "ap-south-1a"
  vpc_id            = aws_vpc.main.id

  tags = {
    Name = "private2"
  }
  depends_on = [aws_vpc.main]
}