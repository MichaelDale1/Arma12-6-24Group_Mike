resource "aws_route_table" "private" {
  count = length(var.vpc_name_loop)

  vpc_id = var.vpc_name_loop[count.index]

  route = [
    {
      cidr_block                 = "0.0.0.0/0"
      nat_gateway_id             = var.naming_convention[count.index].nat_id
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
    Name = "private"
  }
}

resource "aws_route_table" "public" {
  count = length(var.vpc_name_loop)
  vpc_id = var.vpc_name_loop[count.index]

  route = [
    {
      cidr_block                 = "0.0.0.0/0"
      gateway_id                 = var.naming_convention[count.index].igw_id
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
    Name = "public"
  }
}

resource "aws_route_table_association" "private-1st-subnet" {
  count = length(var.vpc_name_loop)  
  subnet_id      = var.naming_convention[count.index].subnet_id1
  route_table_id = aws_route_table.private[count.index].id
}

resource "aws_route_table_association" "private-2nd-subnet" {
  count = length(var.vpc_name_loop)    
  subnet_id      = var.naming_convention[count.index].subnet_id2
  route_table_id = aws_route_table.private[count.index].id
}

resource "aws_route_table_association" "private-3rd-subnet" {
  count = length(var.vpc_name_loop)    
  subnet_id      = var.naming_convention[count.index].subnet_id3
  route_table_id = aws_route_table.private[count.index].id
}

#public

resource "aws_route_table_association" "public-1st-subnet" {
  count = length(var.vpc_name_loop)    
  subnet_id      = var.naming_convention[count.index].subnet_id4
  route_table_id = aws_route_table.public[count.index].id
}

resource "aws_route_table_association" "public-2nd-subnet" {
  count = length(var.vpc_name_loop)    
  subnet_id      = var.naming_convention[count.index].subnet_id5
  route_table_id = aws_route_table.public[count.index].id
}

resource "aws_route_table_association" "public-3rd-subnet" {
  count = length(var.vpc_name_loop)    
  subnet_id      = var.naming_convention[count.index].subnet_id6
  route_table_id = aws_route_table.public[count.index].id
}