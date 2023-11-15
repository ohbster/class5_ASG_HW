#These are   for  public

resource "aws_subnet" "public-subnet-1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.50.1.0/24"
  availability_zone       = "eu-central-2a"
  map_public_ip_on_launch = true

  tags = {
    Name    = "public-eu-central-2a"
    Service = "application1"
    Owner   = "Luke"
    Planet  = "Musafar"
  }
}

resource "aws_subnet" "public-subnet-2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.50.2.0/24"
  availability_zone       = "eu-central-2b"
  map_public_ip_on_launch = true

  tags = {
    Name    = "public-eu-central-2b"
    Service = "application1"
    Owner   = "Luke"
    Planet  = "Musafar"
  }
}


resource "aws_subnet" "public-subnet-3" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.50.3.0/24"
  availability_zone       = "eu-central-2c"
  map_public_ip_on_launch = true

  tags = {
    Name    = "public-eu-central-2c"
    Service = "application1"
    Owner   = "Luke"
    Planet  = "Musafar"
  }
}

#these are for private
resource "aws_subnet" "private-subnet-1" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.50.11.0/24"
  availability_zone = "eu-central-2a"

  tags = {
    Name    = "private-eu-central-2a"
    Service = "application1"
    Owner   = "Luke"
    Planet  = "Musafar"
  }
}

resource "aws_subnet" "private-subnet-2" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.50.12.0/24"
  availability_zone = "eu-central-2b"

  tags = {
    Name    = "private-eu-central-2b"
    Service = "application1"
    Owner   = "Luke"
    Planet  = "Musafar"
  }
}


resource "aws_subnet" "private-subnet-3" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.50.13.0/24"
  availability_zone = "eu-central-2c"

  tags = {
    Name    = "private-eu-central-2c"
    Service = "application1"
    Owner   = "Luke"
    Planet  = "Musafar"
  }
}
