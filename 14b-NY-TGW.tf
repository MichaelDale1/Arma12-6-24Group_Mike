resource "aws_ec2_transit_gateway" "TGW_Armageddon1-NY" {
    provider = aws.NewYork
    description =  "Securely transfer data to Japan from NY"
    default_route_table_association = "disable"
    default_route_table_propagation = "disable"

    tags = {
        Name = "TGW_For_NY"
    } 
}

resource "aws_default_route_table" "VPC_B-NY_RT" {
provider = aws.NewYork
default_route_table_id = aws_vpc.app1-vpc-B-NY.default_route_table_id
  
  route {
  cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.NY_igw.id
  }
  
  route {
    cidr_block = var.tokyo_cidr_blocks[0].cidr_block
    transit_gateway_id = aws_ec2_transit_gateway.TGW_Armageddon1-NY.id
  }

 tags = {
 Name = "VPC_B-NY_RT"
} 
}

resource "aws_ec2_transit_gateway_vpc_attachment" "TGA_VPC_B-NY" {
    provider = aws.NewYork
    subnet_ids = [aws_subnet.public-us-east-1a.id, aws_subnet.public-us-east-1b.id, aws_subnet.public-us-east-1c.id]
    transit_gateway_id = aws_ec2_transit_gateway.TGW_Armageddon1-NY.id
    vpc_id = aws_vpc.app1-vpc-B-NY.id

    tags = {
        Name = "TGA_VPC_B_NY"
    }
}

resource "aws_ec2_transit_gateway_route_table" "TGW_RTB_VPC_B-NY" {
   provider = aws.NewYork
   transit_gateway_id = aws_ec2_transit_gateway.TGW_Armageddon1-NY.id

  tags = {
    "name" = "TGW_RTB_VPC_B-NY"
  }
}

resource "aws_ec2_transit_gateway_route" "TGW_RTB_VPC_B-NY_Route_1-Tokyo" {
  provider = aws.NewYork
  destination_cidr_block         = var.tokyo_cidr_blocks[0].cidr_block
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.TGA_VPC_B-NY.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.TGW_RTB_VPC_B-NY.id
}


resource "aws_vpc_peering_connection" "Request-NY-to-Tokyo-Peering" {
   provider = aws.NewYork
  vpc_id      = aws_vpc.app1-vpc-B-NY.id
  peer_vpc_id = aws_vpc.app1-vpc-A-Tokyo.id
  peer_region = "ap-northeast-1"
}