resource "aws_route_table" "private-California" {
  provider = aws.California
  vpc_id = aws_vpc.app1-vpc-G-California.id

  route = [
    {
      cidr_block                 = "0.0.0.0/0"
      nat_gateway_id             = aws_nat_gateway.California-nat.id
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
    Name = "private-California"
  }
}

resource "aws_route_table" "public-California" {
  provider = aws.California
  vpc_id = aws_vpc.app1-vpc-G-California.id

  route = [
    {
      cidr_block                 = "0.0.0.0/0"
      gateway_id                 = aws_internet_gateway.California_igw.id
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
    Name = "public-California"
    service = "California_VPC_Public_RT"
  }
}

 resource "aws_route_table_association" "private-us-west-1b" {
  provider = aws.California
  subnet_id      = aws_subnet.private-us-west-1b.id
  route_table_id = aws_route_table.private-California.id
}

resource "aws_route_table_association" "private-us-west-1c" {
  provider = aws.California
  subnet_id      = aws_subnet.private-us-west-1c.id
  route_table_id = aws_route_table.private-California.id
}

#public

/*resource "aws_route_table_association" "public-us-west-1a" {
  provider = aws.California
  subnet_id      = aws_subnet.public-us-west-1a.id
  route_table_id = aws_route_table.public-California.id
}*/

resource "aws_route_table_association" "public-us-west-1b" {
  provider = aws.California
  subnet_id      = aws_subnet.public-us-west-1b.id
  route_table_id = aws_route_table.public-California.id
}

resource "aws_route_table_association" "public-us-west-1c" {
  provider = aws.California
  subnet_id      = aws_subnet.public-us-west-1c.id
  route_table_id = aws_route_table.public-California.id
}
