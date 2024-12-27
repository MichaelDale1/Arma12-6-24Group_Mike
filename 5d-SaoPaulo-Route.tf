resource "aws_route_table" "private-SaoPaulo" {
  provider = aws.SaoPaulo
  vpc_id = aws_vpc.app1-vpc-D-Sao-Paulo.id

  route = [
    {
      cidr_block                 = "0.0.0.0/0"
      nat_gateway_id             = aws_nat_gateway.Sao-Paulo-nat.id
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
    Name = "private-SaoPaulo"
  }
}

resource "aws_route_table" "public-SaoPaulo" {
  provider = aws.SaoPaulo
  vpc_id = aws_vpc.app1-vpc-D-Sao-Paulo.id

  route = [
    {
      cidr_block                 = "0.0.0.0/0"
      gateway_id                 = aws_internet_gateway.Sao-Paulo_igw.id
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
    Name = "public-SaoPaulo"
  }
}

resource "aws_route_table_association" "private-sa-east-1a" {
 provider = aws.SaoPaulo
  subnet_id      = aws_subnet.private-sa-east-1a.id
  route_table_id = aws_route_table.private-SaoPaulo.id

  #tags = {
    #Name = var.naming_convention3.SaoPaulo.tags.Name

  #}
}

resource "aws_route_table_association" "private-sa-east-1b" {
  provider = aws.SaoPaulo
  subnet_id      = aws_subnet.private-sa-east-1b.id
  route_table_id = aws_route_table.private-SaoPaulo.id
}

resource "aws_route_table_association" "private-sa-east-1c" {
  provider = aws.SaoPaulo
  subnet_id      = aws_subnet.private-sa-east-1c.id
  route_table_id = aws_route_table.private-SaoPaulo.id
}

#public

resource "aws_route_table_association" "public-sa-east-1a" {
  provider = aws.SaoPaulo
  subnet_id      = aws_subnet.public-sa-east-1a.id
  route_table_id = aws_route_table.public-SaoPaulo.id
}

resource "aws_route_table_association" "public-sa-east-1b" {
  provider = aws.SaoPaulo
  subnet_id      = aws_subnet.public-sa-east-1b.id
  route_table_id = aws_route_table.public-SaoPaulo.id
}

resource "aws_route_table_association" "public-sa-east-1c" {
  provider = aws.SaoPaulo
  subnet_id      = aws_subnet.public-sa-east-1c.id
  route_table_id = aws_route_table.public-SaoPaulo.id
}
