#Creates an Internet Gateway for Tokyo VPC
resource "aws_internet_gateway" "Tokyo_igw" {
  vpc_id = aws_vpc.app1-vpc-A-Tokyo.id

  tags = {
    Name    = var.igw[0]
    Service = "application1"
    Owner   = "Mighty"
    Planet  = "Maximus"
  }
}

#Creates an Internet Gateway for NY VPC
resource "aws_internet_gateway" "NY_igw" {
  provider = aws.NewYork
  vpc_id = aws_vpc.app1-vpc-B-NY.id

  tags = {
    Name    = var.igw[1]
    Service = "application1"
    Owner   = "Mighty"
    Planet  = "Maximus"
  }
}

#Creates an Internet Gateway for London VPC
resource "aws_internet_gateway" "London_igw" {
  provider = aws.london
  vpc_id = aws_vpc.app1-vpc-C-London.id

  tags = {
    Name    = var.igw[2]
    Service = "application1"
    Owner   = "Mighty"
    Planet  = "Maximus"
  }
}

#Creates an Internet Gateway for Sao-Paulo VPC
resource "aws_internet_gateway" "Sao-Paulo_igw" {
  provider = aws.SaoPaulo
  vpc_id = aws_vpc.app1-vpc-D-Sao-Paulo.id

  tags = {
    Name    = var.igw[3]
    Service = "application1"
    Owner   = "Mighty"
    Planet  = "Maximus"
  }
}

#Creates an Internet Gateway for Sydney VPC
resource "aws_internet_gateway" "Sydney_igw" {
  provider = aws.sydney
  vpc_id = aws_vpc.app1-vpc-E-Sydney.id

  tags = {
    Name    = var.igw[4]
    Service = "application1"
    Owner   = "Mighty"
    Planet  = "Maximus"
  }
}

#Creates an Internet Gateway for Hong-Kong VPC
resource "aws_internet_gateway" "Hong-Kong_igw" {
  provider = aws.HongKong
  vpc_id = aws_vpc.app1-vpc-F-Hong-Kong.id

  tags = {
    Name    = var.igw[5]
    Service = "application1"
    Owner   = "Mighty"
    Planet  = "Maximus"
  }
}

#Creates an Internet Gateway for California VPC
resource "aws_internet_gateway" "California_igw" {
  provider = aws.California
  vpc_id = aws_vpc.app1-vpc-G-California.id

  tags = {
    Name    = var.igw[6]
    Service = "application1"
    Owner   = "Mighty"
    Planet  = "Maximus"
  }
}