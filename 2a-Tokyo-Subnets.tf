#These are  for the  public subnets


resource "aws_subnet" "public-ap-northeast-1a" {
  #Tokyo is the default provider
  #provider = aws.tokyo
  vpc_id                  = aws_vpc.app1-vpc-A-Tokyo.id
  cidr_block              = var.tokyo_cidr_blocks[1].cidr_block
  availability_zone       = var.tokyo_cidr_blocks[1].availability_zone
  map_public_ip_on_launch = true

  tags = {
    Name    = var.tokyo_cidr_blocks[1].name
    Service = "application1"
    Owner   = "Mighty"
    Planet  = "Maximus"
  }
}

output "tokyo_subnet1_id" {
  value = aws_subnet.public-ap-northeast-1a.id
}



#AZ 1b is not available in Tokyo
/*
resource "aws_subnet" "public-ap-northeast-1b" {
  #Tokyo is the default provider
  #provider = aws.tokyo
  vpc_id                  = aws_vpc.app1-vpc-A-Tokyo.id
  cidr_block              = var.tokyo_cidr_blocks[2].cidr_block
  availability_zone       = var.tokyo_cidr_blocks[2].availability_zone
  map_public_ip_on_launch = true

  tags = {
    Name    = var.tokyo_cidr_blocks[2].name
    Service = "application1"
    Owner   = "Mighty"
    Planet  = "Maximus"
  }
}
*/

resource "aws_subnet" "public-ap-northeast-1c" {
  #Tokyo is the default provider
  #provider = aws.tokyo
  vpc_id                  = aws_vpc.app1-vpc-A-Tokyo.id
  cidr_block              = var.tokyo_cidr_blocks[3].cidr_block
  availability_zone       = var.tokyo_cidr_blocks[3].availability_zone
  map_public_ip_on_launch = true

  tags = {
    Name    = var.tokyo_cidr_blocks[3].name
    Service = "application1"
    Owner   = "Mighty"
    Planet  = "Maximus"
  }
}

resource "aws_subnet" "public-ap-northeast-1d" {
  #Tokyo is the default provider
  #provider = aws.tokyo
  vpc_id                  = aws_vpc.app1-vpc-A-Tokyo.id
  cidr_block              = var.tokyo_cidr_blocks[4].cidr_block
  availability_zone       = var.tokyo_cidr_blocks[4].availability_zone
  map_public_ip_on_launch = true

  tags = {
    Name    = var.tokyo_cidr_blocks[4].name
    Service = "application1"
    Owner   = "Mighty"
    Planet  = "Maximus"
  }
}


#these are for private
resource "aws_subnet" "private-ap-northeast-1a" {
  #Tokyo is the default provider
  #provider = aws.tokyo
  vpc_id            = aws_vpc.app1-vpc-A-Tokyo.id
  cidr_block        = var.tokyo_cidr_blocks[5].cidr_block
  availability_zone = var.tokyo_cidr_blocks[5].availability_zone

  tags = {
    Name    = var.tokyo_cidr_blocks[5].name
    Service = "application1"
    Owner   = "Mighty"
    Planet  = "Maximus"
  }
}
/*
resource "aws_subnet" "private-ap-northeast-1b" {
  #Tokyo is the default provider
  #provider = aws.tokyo
  vpc_id            = aws_vpc.app1-vpc-A-Tokyo.id
   cidr_block        = var.tokyo_cidr_blocks[6].cidr_block
  availability_zone = var.tokyo_cidr_blocks[6].availability_zone

  tags = {
    Name    = var.tokyo_cidr_blocks[6].name
    Service = "application1"
    Owner   = "Mighty"
    Planet  = "Maximus"
  }
}
*/

resource "aws_subnet" "private-ap-northeast-1c" {
  #Tokyo is the default provider
  #provider = aws.tokyo
  vpc_id            = aws_vpc.app1-vpc-A-Tokyo.id
  cidr_block        = var.tokyo_cidr_blocks[7].cidr_block
  availability_zone = var.tokyo_cidr_blocks[7].availability_zone

  tags = {
    Name    = var.tokyo_cidr_blocks[7].name
    Service = "application1"
    Owner   = "Mighty"
    Planet  = "Maximus"
  }
}

resource "aws_subnet" "private-ap-northeast-1d" {
  #Tokyo is the default provider
  #provider = aws.tokyo
  vpc_id            = aws_vpc.app1-vpc-A-Tokyo.id
  cidr_block        = var.tokyo_cidr_blocks[8].cidr_block
  availability_zone = var.tokyo_cidr_blocks[8].availability_zone

  tags = {
    Name    = var.tokyo_cidr_blocks[8].name
    Service = "application1"
    Owner   = "Mighty"
    Planet  = "Maximus"
  }
}