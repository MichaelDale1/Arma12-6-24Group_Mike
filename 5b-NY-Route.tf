
resource "aws_route_table" "private-NY" {
  provider = aws.NewYork
  vpc_id = aws_vpc.app1-vpc-B-NY.id

  route = [
    {
      cidr_block                 = "0.0.0.0/0"
      nat_gateway_id             = aws_nat_gateway.NY-nat.id
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
    Name = "private-NY"
  }
}

resource "aws_route_table" "public-NY" {
  provider = aws.NewYork
  vpc_id = aws_vpc.app1-vpc-B-NY.id

  route = [
    {
      cidr_block                 = "0.0.0.0/0"
      gateway_id                 = aws_internet_gateway.NY_igw.id
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
    Name = "public-NY"
    service = "NY_VPC_Public_RT"
  }
}

  
resource "aws_route_table_association" "private-us-east-1a" {
 provider = aws.NewYork
  subnet_id      = aws_subnet.private-us-east-1a.id
  route_table_id = aws_route_table.private-NY.id

  #tags = {
    #Name = var.naming_convention3.NY.tags.Name

  #}
}

resource "aws_route_table_association" "private-us-east-1b" {
  provider = aws.NewYork
  subnet_id      = aws_subnet.private-us-east-1b.id
  route_table_id = aws_route_table.private-NY.id
}

resource "aws_route_table_association" "private-us-east-1c" {
  provider = aws.NewYork
  subnet_id      = aws_subnet.private-us-east-1c.id
  route_table_id = aws_route_table.private-NY.id
}

#public

resource "aws_route_table_association" "public-us-east-1a" {
  provider = aws.NewYork
  subnet_id      = aws_subnet.public-us-east-1a.id
  route_table_id = aws_route_table.public-NY.id
}

resource "aws_route_table_association" "public-us-east-1b" {
  provider = aws.NewYork
  subnet_id      = aws_subnet.public-us-east-1b.id
  route_table_id = aws_route_table.public-NY.id
}

resource "aws_route_table_association" "public-us-east-1c" {
  provider = aws.NewYork
  subnet_id      = aws_subnet.public-us-east-1c.id
  route_table_id = aws_route_table.public-NY.id
}
