resource "aws_ec2_transit_gateway" "TGW_Armageddon1-California" {
    provider = aws.California
    description =  "Securely transfer data to Japan from California"
    default_route_table_association = "disable"
    default_route_table_propagation = "disable"

    tags = {
        Name = "TGW_For_California"
    } 
}

resource "aws_default_route_table" "VPC_G-California_RT" {
provider = aws.California
default_route_table_id = aws_vpc.app1-vpc-G-California.default_route_table_id
  
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.California_igw.id
    }
  
    route {
        cidr_block = var.tokyo_cidr_blocks[0].cidr_block
        transit_gateway_id = aws_ec2_transit_gateway.TGW_Armageddon1-California.id
    }

    tags = {
    Name = "VPC_G-California_RT"
    } 
}

resource "aws_ec2_transit_gateway_vpc_attachment" "TGA_VPC_G-California" {
    provider = aws.California
    subnet_ids = [aws_subnet.public-us-west-1b.id , aws_subnet.public-us-west-1c.id]
    transit_gateway_id = aws_ec2_transit_gateway.TGW_Armageddon1-California.id
    vpc_id = aws_vpc.app1-vpc-G-California.id

    tags = {
        Name = "TGA_VPC_G_California"
    }
}

resource "aws_ec2_transit_gateway_route_table" "TGW_RTB_VPC_G-California" {
  provider = aws.California  
  transit_gateway_id = aws_ec2_transit_gateway.TGW_Armageddon1-California.id

  tags = {
    "name" = "TGW_RTB_VPC_G-California"
  }
}

resource "aws_ec2_transit_gateway_route" "TGW_RTB_VPC_G-California_Route_1-Tokyo" {
  provider = aws.California
  destination_cidr_block         = var.tokyo_cidr_blocks[0].cidr_block
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.TGA_VPC_G-California.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.TGW_RTB_VPC_G-California.id
}

resource "aws_vpc_peering_connection" "Request-California-to-Tokyo-Peering" {
    provider = aws.California
    vpc_id      = aws_vpc.app1-vpc-G-California.id
    peer_vpc_id = aws_vpc.app1-vpc-A-Tokyo.id
    peer_region = "ap-northeast-1"
}