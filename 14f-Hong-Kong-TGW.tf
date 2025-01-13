resource "aws_ec2_transit_gateway" "TGW_Armageddon1-Hong-Kong" {
    provider = aws.HongKong
    description =  "Securely transfer data to Japan from HongKong"
    default_route_table_association = "disable"
    default_route_table_propagation = "disable"

    tags = {
        Name = "TGW_For_HongKong"
    } 
}

resource "aws_default_route_table" "VPC_F-Hong-Kong_RT" {
provider = aws.HongKong
default_route_table_id = aws_vpc.app1-vpc-F-Hong-Kong.default_route_table_id
  
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.Hong-Kong_igw.id
    }
  
    route {
        cidr_block = var.tokyo_cidr_blocks[0].cidr_block
        transit_gateway_id = aws_ec2_transit_gateway.TGW_Armageddon1-Hong-Kong.id
    }

    tags = {
    Name = "VPC_F-Hong-Kong_RT"
    } 
}

resource "aws_ec2_transit_gateway_vpc_attachment" "TGA_VPC_F-Hong-Kong" {
    provider = aws.HongKong
    subnet_ids = [aws_subnet.public-ap-east-1a.id , aws_subnet.public-ap-east-1b.id  , aws_subnet.public-ap-east-1c.id]
    transit_gateway_id = aws_ec2_transit_gateway.TGW_Armageddon1-Hong-Kong.id
    vpc_id = aws_vpc.app1-vpc-F-Hong-Kong.id

    tags = {
        Name = "TGA_VPC_F_HongKong"
    }
}

resource "aws_ec2_transit_gateway_route_table" "TGW_RTB_VPC_F-Hong-Kong" {
  provider = aws.HongKong
  transit_gateway_id = aws_ec2_transit_gateway.TGW_Armageddon1-Hong-Kong.id

  tags = {
    "name" = "TGW_RTB_VPC_F-Hong-Kong"
  }
}

resource "aws_ec2_transit_gateway_route" "TGW_RTB_VPC_F-Hong-Kong_Route_1-Tokyo" {
  provider = aws.HongKong
  destination_cidr_block         = var.tokyo_cidr_blocks[0].cidr_block
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.TGA_VPC_F-Hong-Kong.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.TGW_RTB_VPC_F-Hong-Kong.id
}

resource "aws_vpc_peering_connection" "Request-Hong-Kong-to-Tokyo-Peering" {
    provider = aws.HongKong
    vpc_id      = aws_vpc.app1-vpc-F-Hong-Kong.id
    peer_vpc_id = aws_vpc.app1-vpc-A-Tokyo.id
    peer_region ="ap-northeast-1"
}