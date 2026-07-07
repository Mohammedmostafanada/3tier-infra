resource "aws_vpc" "main" {

  cidr_block = "10.0.0.0/16"

  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "3tier-vpc"
  }

}


resource "aws_subnet" "public" {

  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "3tier-public-subnet"
  }

}


resource "aws_subnet" "private_app" {

  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = false

  tags = {
    Name = "3tier-private-app-subnet"
  }

}


resource "aws_subnet" "private_db" {

  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.3.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = false

  tags = {
    Name = "3tier-private-db-subnet"
  }

}


resource "aws_internet_gateway" "igw" {

  vpc_id = aws_vpc.main.id

  tags = {
    Name = "3tier-igw"
  }

}


resource "aws_eip" "nat" {

  tags = {
    Name = "3tier-nat-eip"
  }

}


resource "aws_nat_gateway" "nat" {

  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public.id

  depends_on = [
    aws_internet_gateway.igw
  ]

  tags = {
    Name = "3tier-nat"
  }

}


resource "aws_route_table" "public" {

  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "3tier-public-rt"
  }

}


resource "aws_route_table_association" "public" {

  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id

}


resource "aws_route_table" "private" {

  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
  }

  tags = {
    Name = "3tier-private-rt"
  }

}


resource "aws_route_table_association" "private_app" {

  subnet_id      = aws_subnet.private_app.id
  route_table_id = aws_route_table.private.id

}


resource "aws_route_table_association" "private_db" {

  subnet_id      = aws_subnet.private_db.id
  route_table_id = aws_route_table.private.id

}
