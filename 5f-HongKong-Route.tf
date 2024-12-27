resource "aws_route_table" "private-HongKong" {
  provider = aws.HongKong
  vpc_id = aws_vpc.app1-vpc-F-Hong-Kong.id

  route = [
    {
      cidr_block                 = "0.0.0.0/0"
      nat_gateway_id             = aws_nat_gateway.Hong-Kong-nat.id
      carrier_gateway_id         = ""
      destination_prefix_list_id = ""
      egress_only_gateway_id     = ""
      gateway_id                 = ""
      instance_id                = ""
      ipv6_cidr_block            = ""
      local_gateway_id           = ""
      network_interface_id       = ""
      transit_gateway_id         = ""
      vpc_endpoint_id            = ""
      vpc_peering_connection_id  = ""
    },
  ]

  tags = {
    Name = "private-HongKong"
  }
}

resource "aws_route_table" "public-HongKong" {
  provider = aws.HongKong
  vpc_id = aws_vpc.app1-vpc-F-Hong-Kong.id

  route = [
    {
      cidr_block                 = "0.0.0.0/0"
      gateway_id                 = aws_internet_gateway.Hong-Kong_igw.id
      nat_gateway_id             = ""
      carrier_gateway_id         = ""
      destination_prefix_list_id = ""
      egress_only_gateway_id     = ""
      instance_id                = ""
      ipv6_cidr_block            = ""
      local_gateway_id           = ""
      network_interface_id       = ""
      transit_gateway_id         = ""
      vpc_endpoint_id            = ""
      vpc_peering_connection_id  = ""
    },
  ]

  tags = {
    Name = "public-HongKong"
  }
}

resource "aws_route_table_association" "private-ap-east-1a" {
 provider = aws.HongKong
  subnet_id      = aws_subnet.private-ap-east-1a.id
  route_table_id = aws_route_table.private-HongKong.id

  #tags = {
    #Name = var.naming_convention3.HongKong.tags.Name

  #}
}

resource "aws_route_table_association" "private-ap-east-1b" {
  provider = aws.HongKong
  subnet_id      = aws_subnet.private-ap-east-1b.id
  route_table_id = aws_route_table.private-HongKong.id
}

resource "aws_route_table_association" "private-ap-east-1c" {
  provider = aws.HongKong
  subnet_id      = aws_subnet.private-ap-east-1c.id
  route_table_id = aws_route_table.private-HongKong.id
}

#public

resource "aws_route_table_association" "public-ap-east-1a" {
  provider = aws.HongKong
  subnet_id      = aws_subnet.public-ap-east-1a.id
  route_table_id = aws_route_table.public-HongKong.id
}

resource "aws_route_table_association" "public-ap-east-1b" {
  provider = aws.HongKong
  subnet_id      = aws_subnet.public-ap-east-1b.id
  route_table_id = aws_route_table.public-HongKong.id
}

resource "aws_route_table_association" "public-ap-east-1c" {
  provider = aws.HongKong
  subnet_id      = aws_subnet.public-ap-east-1c.id
  route_table_id = aws_route_table.public-HongKong.id
}
