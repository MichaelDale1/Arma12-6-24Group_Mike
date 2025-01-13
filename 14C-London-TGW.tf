resource "aws_ec2_transit_gateway" "TGW_Armageddon1-London" {
    provider = aws.london
    description =  "Securely transfer data to Japan from London"
    default_route_table_association = "disable"
    default_route_table_propagation = "disable"

    tags = {
        Name = "TGW_For_London"
    } 
}

resource "aws_default_route_table" "VPC_C-London_RT" {
provider = aws.london
default_route_table_id = aws_vpc.app1-vpc-C-London.default_route_table_id
  
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.London_igw.id
    }
  
    route {
        cidr_block = var.tokyo_cidr_blocks[0].cidr_block
        transit_gateway_id = aws_ec2_transit_gateway.TGW_Armageddon1-London.id
    }

    tags = {
    Name = "VPC_C-London_RT"
    } 
}

resource "aws_ec2_transit_gateway_vpc_attachment" "TGA_VPC_C-London" {
    provider = aws.london
    subnet_ids = [aws_subnet.public-eu-west-2a.id, aws_subnet.public-eu-west-2b.id  , aws_subnet.public-eu-west-2c.id]
    transit_gateway_id = aws_ec2_transit_gateway.TGW_Armageddon1-London.id
    vpc_id = aws_vpc.app1-vpc-C-London.id

    tags = {
        Name = "TGA_VPC_C_London"
    }
}

resource "aws_ec2_transit_gateway_route_table" "TGW_RTB_VPC_C-London" {
  provider = aws.london  
  transit_gateway_id = aws_ec2_transit_gateway.TGW_Armageddon1-London.id

  tags = {
    "name" = "TGW_RTB_VPC_C-London"
  }
}

resource "aws_ec2_transit_gateway_route" "TGW_RTB_VPC_C-London_Route_1-Tokyo" {
  provider = aws.london  
  destination_cidr_block         = var.tokyo_cidr_blocks[0].cidr_block
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.TGA_VPC_C-London.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.TGW_RTB_VPC_C-London.id
}



resource "aws_vpc_peering_connection" "Request-London-to-Tokyo-Peering" {
    provider = aws.london
    vpc_id      = aws_vpc.app1-vpc-C-London.id
    peer_vpc_id = aws_vpc.app1-vpc-A-Tokyo.id
    peer_region = "ap-northeast-1"
  }
