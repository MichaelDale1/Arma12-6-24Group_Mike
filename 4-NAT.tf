#By default 5 Elastic IP limit...must request more to create 7
#Creates an elastic IP for Tokyo NAT
resource "aws_eip" "tokyo-eip" {
  vpc = true

  tags = {
    Name = var.eip[0]
  }
}

#Creates a NAT for Tokyo in public subnet
resource "aws_nat_gateway" "tokyo-nat" {
  allocation_id = aws_eip.tokyo-eip.id
  subnet_id     = aws_subnet.public-ap-northeast-1a.id
  tags = {
    Name = var.nat[0]
  }
  depends_on = [aws_internet_gateway.Tokyo_igw]
}

#Creates an elastic IP for NY NAT
resource "aws_eip" "NY-eip" {
  provider = aws.NewYork
  vpc = true

  tags = {
    Name = var.eip[1]
  }
}

#Creates a NAT for NY in public subnet
resource "aws_nat_gateway" "NY-nat" {
  provider = aws.NewYork
  allocation_id = aws_eip.NY-eip.id
  subnet_id     = aws_subnet.public-us-east-1a.id

  tags = {
    Name = var.nat[1]
  }

  depends_on = [aws_internet_gateway.NY_igw]
}

#Creates an elastic IP for London NAT
resource "aws_eip" "London-eip" {
  provider = aws.london
  vpc = true

  tags = {
    Name = var.eip[2]
  }
}

#Creates a NAT for London in public subnet
resource "aws_nat_gateway" "London-nat" {
  provider = aws.london
  allocation_id = aws_eip.London-eip.id
  subnet_id     = aws_subnet.public-eu-west-2a.id

  tags = {
    Name = var.nat[2]
  }

  depends_on = [aws_internet_gateway.London_igw]
}

#Creates an elastic IP for Sao Paulo NAT
resource "aws_eip" "Sao-Paulo-eip" {
  provider = aws.SaoPaulo
  vpc = true

  tags = {
    Name = var.eip[3]
  }
}

#Creates a NAT for Sao Paulo in public subnet
resource "aws_nat_gateway" "Sao-Paulo-nat" {
  provider = aws.SaoPaulo
  allocation_id = aws_eip.Sao-Paulo-eip.id
  subnet_id     = aws_subnet.public-sa-east-1a.id

  tags = {
    Name = var.nat[3]
  }

  depends_on = [aws_internet_gateway.Sao-Paulo_igw]
}

#Creates an elastic IP for Sydney NAT
resource "aws_eip" "Sydney-eip" {
  provider = aws.sydney
  vpc = true

  tags = {
    Name = var.eip[4]
  }
}

#Creates a NAT for Sydney in public subnet
resource "aws_nat_gateway" "Sydney-nat" {
  provider = aws.sydney
  allocation_id = aws_eip.Sydney-eip.id
  subnet_id     = aws_subnet.public-ap-southeast-2a.id

  tags = {
    Name = var.nat[4]
  }

  depends_on = [aws_internet_gateway.Sydney_igw]
}


#Creates an elastic IP for Hong Kong NAT
resource "aws_eip" "Hong-Kong-eip" {
  provider = aws.HongKong
  vpc = true

  tags = {
    Name = var.eip[5]
  }
}

#Creates a NAT for Hong Kong in public subnet
resource "aws_nat_gateway" "Hong-Kong-nat" {
  provider = aws.HongKong
  allocation_id = aws_eip.Hong-Kong-eip.id
  subnet_id     = aws_subnet.public-ap-east-1a.id

  tags = {
    Name = var.nat[5]
  }

  depends_on = [aws_internet_gateway.NY_igw]
}

#Creates an elastic IP for California NAT
resource "aws_eip" "California-eip" {
  provider = aws.California
  vpc = true

  tags = {
    Name = var.eip[6]
  }
}

#Creates a NAT for California in public subnet 1b
resource "aws_nat_gateway" "California-nat" {
  provider = aws.California
  allocation_id = aws_eip.California-eip.id
  subnet_id     = aws_subnet.public-us-west-1b.id

  tags = {
    Name = var.nat[6]
  }

  depends_on = [aws_internet_gateway.California_igw]
}

