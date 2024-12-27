#These are  for the  public subnets

/*
resource "aws_subnet" "public-us-west-1a" {
#California uses N. California / AZ 1a is N/A
  provider = aws.California
  vpc_id                  = aws_vpc.app1-vpc-G-California.id
  cidr_block              = var.california_cidr_blocks[1].cidr_block
  availability_zone       = var.california_cidr_blocks[1].availability_zone
  map_public_ip_on_launch = true

  tags = {
    Name    = var.california_cidr_blocks[1].name
    Service = "application1"
    Owner   = "Mighty"
    Planet  = "Maximus"
  }
}
*/

resource "aws_subnet" "public-us-west-1b" {
  #California uses N. California / AZ 1a is N/A
  provider = aws.California
  vpc_id                  = aws_vpc.app1-vpc-G-California.id
  cidr_block              = var.california_cidr_blocks[2].cidr_block
  availability_zone       = var.california_cidr_blocks[2].availability_zone
  map_public_ip_on_launch = true

  tags = {
    Name    = var.california_cidr_blocks[2].name
    Service = "application1"
    Owner   = "Mighty"
    Planet  = "Maximus"
  }
}


resource "aws_subnet" "public-us-west-1c" {
  #California uses N. California / AZ 1a is N/A
  provider = aws.California
  vpc_id                  = aws_vpc.app1-vpc-G-California.id
  cidr_block              = var.california_cidr_blocks[3].cidr_block
  availability_zone       = var.california_cidr_blocks[3].availability_zone
  map_public_ip_on_launch = true

  tags = {
    Name    = var.california_cidr_blocks[3].name
    Service = "application1"
    Owner   = "Mighty"
    Planet  = "Maximus"
  }
}



#these are for private
/*
resource "aws_subnet" "private-us-west-1a" {
  #California uses N. California / AZ 1a is N/A
  provider = aws.California
  vpc_id            = aws_vpc.app1-vpc-G-California.id
  cidr_block        = var.california_cidr_blocks[4].cidr_block
  availability_zone = var.california_cidr_blocks[4].availability_zone

  tags = {
    Name    = var.california_cidr_blocks[4].name
    Service = "application1"
    Owner   = "Mighty"
    Planet  = "Maximus"
  }
}
*/

resource "aws_subnet" "private-us-west-1b" {
  #California uses N. California / AZ 1a is N/A
  provider = aws.California
  vpc_id            = aws_vpc.app1-vpc-G-California.id
   cidr_block        = var.california_cidr_blocks[5].cidr_block
  availability_zone = var.california_cidr_blocks[5].availability_zone

  tags = {
    Name    = var.california_cidr_blocks[5].name
    Service = "application1"
    Owner   = "Mighty"
    Planet  = "Maximus"
  }
}


resource "aws_subnet" "private-us-west-1c" {
  #California uses N. California / AZ 1a is N/A
  provider = aws.California
  vpc_id            = aws_vpc.app1-vpc-G-California.id
  cidr_block        = var.california_cidr_blocks[6].cidr_block
  availability_zone = var.california_cidr_blocks[6].availability_zone

  tags = {
    Name    = var.california_cidr_blocks[6].name
    Service = "application1"
    Owner   = "Mighty"
    Planet  = "Maximus"
  }
}

