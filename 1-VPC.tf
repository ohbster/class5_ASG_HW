# this  makes  vpc.id which is aws_vpc.app1.id
resource "aws_vpc" "vpc" {
  cidr_block = "10.50.0.0/16"

  tags = {
    Name = "Houston Tech"
    Service = "tech"
    Owner = "Shannon"
    Planet = "Houston"
  }
}
