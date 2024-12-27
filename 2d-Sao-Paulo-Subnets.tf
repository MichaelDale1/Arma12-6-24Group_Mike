#These are  for the  public subnets


resource "aws_subnet" "public-sa-east-1a" {
  #Brazil uses Sao Paulo Region/ Theo advise us not use AZ sa-east1b
  provider = aws.SaoPaulo
  vpc_id                  = aws_vpc.app1-vpc-D-Sao-Paulo.id
  cidr_block              = var.SaoPaulo_cidr_blocks[1].cidr_block
  availability_zone       = var.SaoPaulo_cidr_blocks[1].availability_zone
  map_public_ip_on_launch = true

  tags = {
    Name    = var.SaoPaulo_cidr_blocks[1].name
    Service = "application1"
    Owner   = "Mighty"
    Planet  = "Maximus"
  }
}


resource "aws_subnet" "public-sa-east-1b" {
  #Brazil uses Sao Paulo Region/ Theo advise us not use AZ sa-east1b
  provider = aws.SaoPaulo
  vpc_id                  = aws_vpc.app1-vpc-D-Sao-Paulo.id
  cidr_block              = var.SaoPaulo_cidr_blocks[2].cidr_block
  availability_zone       = var.SaoPaulo_cidr_blocks[2].availability_zone
  map_public_ip_on_launch = true

  tags = {
    Name    = var.SaoPaulo_cidr_blocks[2].name
    Service = "application1"
    Owner   = "Mighty"
    Planet  = "Maximus"
  }
}


resource "aws_subnet" "public-sa-east-1c" {
  #Brazil uses Sao Paulo Region/ Theo advise us not use AZ sa-east1b
  provider = aws.SaoPaulo
  vpc_id                  = aws_vpc.app1-vpc-D-Sao-Paulo.id
  cidr_block              = var.SaoPaulo_cidr_blocks[3].cidr_block
  availability_zone       = var.SaoPaulo_cidr_blocks[3].availability_zone
  map_public_ip_on_launch = true

  tags = {
    Name    = var.SaoPaulo_cidr_blocks[3].name
    Service = "application1"
    Owner   = "Mighty"
    Planet  = "Maximus"
  }
}



#these are for private
resource "aws_subnet" "private-sa-east-1a" {
  #Brazil uses Sao Paulo Region/ Theo advise us not use AZ sa-east1b
  provider = aws.SaoPaulo
  vpc_id            = aws_vpc.app1-vpc-D-Sao-Paulo.id
  cidr_block        = var.SaoPaulo_cidr_blocks[4].cidr_block
  availability_zone = var.SaoPaulo_cidr_blocks[4].availability_zone

  tags = {
    Name    = var.SaoPaulo_cidr_blocks[4].name
    Service = "application1"
    Owner   = "Mighty"
    Planet  = "Maximus"
  }
}

resource "aws_subnet" "private-sa-east-1b" {
  #Brazil uses Sao Paulo Region/ Theo advise us not use AZ sa-east1b
  provider = aws.SaoPaulo
  vpc_id            = aws_vpc.app1-vpc-D-Sao-Paulo.id
   cidr_block        = var.SaoPaulo_cidr_blocks[5].cidr_block
  availability_zone = var.SaoPaulo_cidr_blocks[5].availability_zone

  tags = {
    Name    = var.SaoPaulo_cidr_blocks[5].name
    Service = "application1"
    Owner   = "Mighty"
    Planet  = "Maximus"
  }
}


resource "aws_subnet" "private-sa-east-1c" {
  #Brazil uses Sao Paulo Region/ Theo advise us not use AZ sa-east1b
  provider = aws.SaoPaulo
  vpc_id            = aws_vpc.app1-vpc-D-Sao-Paulo.id
  cidr_block        = var.SaoPaulo_cidr_blocks[6].cidr_block
  availability_zone = var.SaoPaulo_cidr_blocks[6].availability_zone

  tags = {
    Name    = var.SaoPaulo_cidr_blocks[6].name
    Service = "application1"
    Owner   = "Mighty"
    Planet  = "Maximus"
  }
}

