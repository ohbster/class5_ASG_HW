resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name    = "Houston_IG"
    Service = "application1"
    Owner   = "Luke"
    Planet  = "Musafar"
  }
}
