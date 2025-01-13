resource "aws_ec2_transit_gateway" "TGW_Armageddon1-Sydney" {
    provider = aws.sydney
    description =  "Securely transfer data to Japan from Sydney"
    default_route_table_association = "disable"
    default_route_table_propagation = "disable"

    tags = {
        Name = "TGW_For_Sydney"
    } 
}

resource "aws_default_route_table" "VPC_E-Sydney_RT" {
provider = aws.sydney
default_route_table_id = aws_vpc.app1-vpc-E-Sydney.default_route_table_id
  
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.Sydney_igw.id
    }
  
    route {
        cidr_block = var.tokyo_cidr_blocks[0].cidr_block
        transit_gateway_id = aws_ec2_transit_gateway.TGW_Armageddon1-Sydney.id
    }

    tags = {
    Name = "VPC_E-Sydney_RT"
    } 
}

resource "aws_ec2_transit_gateway_vpc_attachment" "TGA_VPC_E-Sydney" {
    provider = aws.sydney
    subnet_ids = [aws_subnet.public-ap-southeast-2a.id , aws_subnet.public-ap-southeast-2b.id , aws_subnet.public-ap-southeast-2c.id]
    transit_gateway_id = aws_ec2_transit_gateway.TGW_Armageddon1-Sydney.id
    vpc_id = aws_vpc.app1-vpc-E-Sydney.id

    tags = {
        Name = "TGA_VPC_E_Sydney"
    }
}

resource "aws_ec2_transit_gateway_route_table" "TGW_RTB_VPC_E-Sydney" {
  provider = aws.sydney
  transit_gateway_id = aws_ec2_transit_gateway.TGW_Armageddon1-Sydney.id

  tags = {
    "name" = "TGW_RTB_VPC_E-Sydney"
  }
}

resource "aws_ec2_transit_gateway_route" "TGW_RTB_VPC_E-Sydney_Route_1-Tokyo" {
  provider = aws.sydney
  destination_cidr_block         = var.tokyo_cidr_blocks[0].cidr_block
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.TGA_VPC_E-Sydney.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.TGW_RTB_VPC_E-Sydney.id
}


resource "aws_vpc_peering_connection" "Request-Sydney-to-Tokyo-Peering" {
    provider = aws.sydney
    vpc_id      = aws_vpc.app1-vpc-E-Sydney.id
    peer_vpc_id = aws_vpc.app1-vpc-A-Tokyo.id
    peer_region = "ap-northeast-1"
  }