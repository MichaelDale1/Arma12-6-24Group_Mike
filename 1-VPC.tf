# this  makes  vpc.id which is aws_vpc.app1.id
/*
resource "aws_vpc" "app1-vpc-A-Tokyo" {
  cidr_block = "10.213.0.0/16"
  #provider =      aws.tokyo 
     
  tags = {
    Name = "app1"
    Service = "application1"
    Owner = "Mighty"
    Planet = "Maximus"
  }
}
*/






# this  makes Tokyo  vpc.id which is aws_vpc.app1-vpc-A-Tokyo.id
resource "aws_vpc" "app1-vpc-A-Tokyo" {
  cidr_block = var.tokyo_cidr_blocks[0].cidr_block
  #Unnecessary because Tokyo is the default provider
  /*provider =      aws.tokyo */ 
     
  tags = {
    Name = var.tokyo_cidr_blocks[0].name
    Service = "application1"
    Owner = "Mighty"
    Planet = "Maximus"
  }
}

# this  makes New York  vpc.id which is aws_vpc.app1-vpc-B-NY.id
resource "aws_vpc" "app1-vpc-B-NY" {
  cidr_block = var.ny_cidr_blocks[0].cidr_block
  provider =      aws.NewYork 
     
  tags = {
    Name = var.ny_cidr_blocks[0].name
    Service = "application1"
    Owner = "Mighty"
    Planet = "Maximus"
  }
}


# this  makes London  vpc.id which is aws_vpc.app1-vpc-C-London.id
resource "aws_vpc" "app1-vpc-C-London" {
  cidr_block = var.london_cidr_blocks[0].cidr_block
  provider =      aws.london 
     
  tags = {
    Name = var.london_cidr_blocks[0].name
    Service = "application1"
    Owner = "Mighty"
    Planet = "Maximus"
  }
}

# this  makes SaoPaulo  vpc.id which is aws_vpc.app1-vpc-D-Sao-Paulo.id
resource "aws_vpc" "app1-vpc-D-Sao-Paulo" {
  cidr_block = var.SaoPaulo_cidr_blocks[0].cidr_block
  provider =      aws.SaoPaulo 
     
  tags = {
    Name = var.SaoPaulo_cidr_blocks[0].name
    Service = "application1"
    Owner = "Mighty"
    Planet = "Maximus"
  }
}

# this  makes Sydney  vpc.id which is aws_vpc.app1-vpc-E-Sydney.id
resource "aws_vpc" "app1-vpc-E-Sydney" {
  cidr_block = var.Sydney_cidr_blocks[0].cidr_block
  provider =      aws.sydney 
     
  tags = {
    Name = var.Sydney_cidr_blocks[0].name
    Service = "application1"
    Owner = "Mighty"
    Planet = "Maximus"
  }
}

# this  makes Hong-Kong vpc.id which is aws_vpc.app1-vpc-F-Hong-Kong.id
resource "aws_vpc" "app1-vpc-F-Hong-Kong" {
  cidr_block = var.HongKong_cidr_blocks[0].cidr_block
  provider =      aws.HongKong 
     
  tags = {
    Name = var.HongKong_cidr_blocks[0].name
    Service = "application1"
    Owner = "Mighty"
    Planet = "Maximus"
  }
}

# this  makes California vpc.id which is aws_vpc.app1-vpc-G-California.id
resource "aws_vpc" "app1-vpc-G-California" {
  cidr_block = var.california_cidr_blocks[0].cidr_block
  provider =      aws.California

  tags = {
    Name = var.california_cidr_blocks[0].name
    Service = "application1"
    Owner = "Mighty"
    Planet = "Maximus"
  }
}