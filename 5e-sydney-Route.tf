resource "aws_route_table" "private-sydney" {
  provider = aws.sydney
  vpc_id = aws_vpc.app1-vpc-E-Sydney.id

  route = [
    {
      cidr_block                 = "0.0.0.0/0"
      nat_gateway_id             = aws_nat_gateway.Sydney-nat.id
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
    Name = "private-sydney"
  }
}

resource "aws_route_table" "public-sydney" {
  provider = aws.sydney
  vpc_id = aws_vpc.app1-vpc-E-Sydney.id

  route = [
    {
      cidr_block                 = "0.0.0.0/0"
      gateway_id                 = aws_internet_gateway.Sydney_igw.id
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
    Name = "public-sydney"
    service = "Sydney_VPC_Public_RT"
  }
}

  
resource "aws_route_table_association" "private-ap-southeast-2a" {
 provider = aws.sydney
  subnet_id      = aws_subnet.private-ap-southeast-2a.id
  route_table_id = aws_route_table.private-sydney.id

  #tags = {
    #Name = var.naming_convention3.sydney.tags.Name

  #}
}

resource "aws_route_table_association" "private-ap-southeast-2b" {
  provider = aws.sydney
  subnet_id      = aws_subnet.private-ap-southeast-2b.id
  route_table_id = aws_route_table.private-sydney.id
}

resource "aws_route_table_association" "private-ap-southeast-2c" {
  provider = aws.sydney
  subnet_id      = aws_subnet.private-ap-southeast-2c.id
  route_table_id = aws_route_table.private-sydney.id
}

#public

resource "aws_route_table_association" "public-ap-southeast-2a" {
  provider = aws.sydney
  subnet_id      = aws_subnet.public-ap-southeast-2a.id
  route_table_id = aws_route_table.public-sydney.id
}

resource "aws_route_table_association" "public-ap-southeast-2b" {
  provider = aws.sydney
  subnet_id      = aws_subnet.public-ap-southeast-2b.id
  route_table_id = aws_route_table.public-sydney.id
}

resource "aws_route_table_association" "public-ap-southeast-2c" {
  provider = aws.sydney
  subnet_id      = aws_subnet.public-ap-southeast-2c.id
  route_table_id = aws_route_table.public-sydney.id
}
