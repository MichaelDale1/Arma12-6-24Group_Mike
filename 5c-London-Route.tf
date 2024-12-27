
resource "aws_route_table" "private-London" {
  provider = aws.london
  vpc_id = aws_vpc.app1-vpc-C-London.id

  route = [
    {
      cidr_block                 = "0.0.0.0/0"
      nat_gateway_id             = aws_nat_gateway.London-nat.id
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
    Name = "private-London"
  }
}

resource "aws_route_table" "public-London" {
  provider = aws.london
  vpc_id = aws_vpc.app1-vpc-C-London.id

  route = [
    {
      cidr_block                 = "0.0.0.0/0"
      gateway_id                 = aws_internet_gateway.London_igw.id
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
    Name = "public-London"
  }
}

resource "aws_route_table_association" "private-eu-west-2a" {
 provider = aws.london
  subnet_id      = aws_subnet.private-eu-west-2a.id
  route_table_id = aws_route_table.private-London.id

  #tags = {
    #Name = var.naming_convention3.London.tags.Name

  #}
}

resource "aws_route_table_association" "private-eu-west-2b" {
  provider = aws.london
  subnet_id      = aws_subnet.private-eu-west-2b.id
  route_table_id = aws_route_table.private-London.id
}

resource "aws_route_table_association" "private-eu-west-2c" {
  provider = aws.london
  subnet_id      = aws_subnet.private-eu-west-2c.id
  route_table_id = aws_route_table.private-London.id
}

#public

resource "aws_route_table_association" "public-eu-west-2a" {
  provider = aws.london
  subnet_id      = aws_subnet.public-eu-west-2a.id
  route_table_id = aws_route_table.public-London.id
}

resource "aws_route_table_association" "public-eu-west-2b" {
  provider = aws.london
  subnet_id      = aws_subnet.public-eu-west-2b.id
  route_table_id = aws_route_table.public-London.id
}

resource "aws_route_table_association" "public-eu-west-2c" {
  provider = aws.london
  subnet_id      = aws_subnet.public-eu-west-2c.id
  route_table_id = aws_route_table.public-London.id
}
