resource "aws_route_table" "private" {
  for_each = var.naming_convention2


  vpc_id = aws_vpc.[each.value.vpc_id].id

  route = [
    {
      cidr_block                 = "0.0.0.0/0"
      nat_gateway_id             = aws_internet_gateway._1[each.value.nat_id].id
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
  for_each = var.naming_convention2


  vpc_id = aws_vpc._1[each.value.vpc_id].id
  route = [
    {
      cidr_block                 = "0.0.0.0/0"
      gateway_id                 = aws_internet_gateway._1[each.value.nat_id].id
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
  for_each = var.naming_convention2 
  #provider = aws._1[each.key]
  subnet_id      = aws_subnet._1[each.value.subnet_id1].id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private-2nd-subnet" {
   for_each =var.naming_convention2 
 # provider = aws._1[each.key] 
  subnet_id      = aws_subnet._1[each.value.subnet_id2].id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private-3rd-subnet" {
   for_each =var.naming_convention2 
  #provider = aws._1[each.key] 
  subnet_id      = aws_subnet._1[each.value.subnet_id3].id
  route_table_id = aws_route_table.private.id
}

#public

resource "aws_route_table_association" "public-1st-subnet" {
   for_each =var.naming_convention2 
  #provider = aws._1[each.key] 
  subnet_id      = aws_subnet._1[each.value.subnet_id4].id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public-2nd-subnet" {
   for_each =var.naming_convention2 
  #provider = aws._1[each.key] 
  subnet_id      = aws_subnet._1[each.value.subnet_id5].id
  route_table_id = aws_route_table.public.id
}
resource "aws_route_table_association" "public-3rd-subnet" {
   for_each =var.naming_convention2 
  #provider = aws._1[each.key] 
  subnet_id      = aws_subnet._1[each.value.subnet_id6].id
  route_table_id = aws_route_table.public.id
}