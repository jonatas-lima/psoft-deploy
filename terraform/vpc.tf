resource "aws_vpc" "deploy" {
  cidr_block           = "192.168.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true
  enable_classiclink   = false

  tags = {
    Name = "deploy"
  }
}

resource "aws_subnet" "deploy-public-1" {
  vpc_id                  = aws_vpc.deploy.id
  cidr_block              = "192.168.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-2a"

  tags = {
    Name = "deploy-public-1"
  }
}

resource "aws_subnet" "deploy-private-1" {
  vpc_id                  = aws_vpc.deploy.id
  cidr_block              = "192.168.2.0/24"
  map_public_ip_on_launch = false
  availability_zone       = "us-east-2a"
  tags = {
    Name = "deploy-private-1"
  }
}

resource "aws_internet_gateway" "deploy-gw" {
  vpc_id = aws_vpc.deploy.id

  tags = {
    Name = "deploy"
  }
}

resource "aws_route_table" "deploy-rt" {
  vpc_id = aws_vpc.deploy.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.deploy-gw.id
  }

  tags = {
    "Name" = "deploy route table"
  }
}

resource "aws_route_table_association" "deploy-public-1-a" {
  subnet_id      = aws_subnet.deploy-public-1.id
  route_table_id = aws_route_table.deploy-rt.id
}
