resource "aws_ec2_transit_gateway" "TGW_Armageddon1-Sao-Paulo" {
    provider = aws.SaoPaulo
    description =  "Securely transfer data to Japan via Sao-Paulo"
    default_route_table_association = "disable"
    default_route_table_propagation = "disable"

    tags = {
        Name = "TGW_For_Sao-Paulo"
    } 
}

resource "aws_default_route_table" "VPC_D-Sao-Paulo_RT" {
provider = aws.SaoPaulo
default_route_table_id = aws_vpc.app1-vpc-D-Sao-Paulo.default_route_table_id
  
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.Sao-Paulo_igw.id
    }
  
    route {
        cidr_block = var.tokyo_cidr_blocks[0].cidr_block
        transit_gateway_id = aws_ec2_transit_gateway.TGW_Armageddon1-Sao-Paulo.id
    }

    tags = {
    Name = "VPC_D-Sao-Paulo_RT"
    } 
}

resource "aws_ec2_transit_gateway_vpc_attachment" "TGA_VPC_D-Sao-Paulo" {
    provider = aws.SaoPaulo
    subnet_ids = [aws_subnet.public-sa-east-1a.id , aws_subnet.public-sa-east-1b.id , aws_subnet.public-sa-east-1c.id]
    transit_gateway_id = aws_ec2_transit_gateway.TGW_Armageddon1-Sao-Paulo.id
    vpc_id = aws_vpc.app1-vpc-D-Sao-Paulo.id

    tags = {
        Name = "TGA_VPC_D_SaoPaulo"
    }
}

resource "aws_ec2_transit_gateway_route_table" "TGW_RTB_VPC_D-Sao-Paulo" {
  provider = aws.SaoPaulo
  transit_gateway_id = aws_ec2_transit_gateway.TGW_Armageddon1-Sao-Paulo.id

  tags = {
    "name" = "TGW_RTB_VPC_D-Sao-Paulo"
  }
}

resource "aws_ec2_transit_gateway_route" "TGW_RTB_VPC_D-Sao-Paulo_Route_1-Tokyo" {
  provider = aws.SaoPaulo
  destination_cidr_block         = var.tokyo_cidr_blocks[0].cidr_block
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.TGA_VPC_D-Sao-Paulo.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.TGW_RTB_VPC_D-Sao-Paulo.id
}

resource "aws_vpc_peering_connection" "Request-Sao-Paulo-to-Tokyo-Peering" {
    provider = aws.SaoPaulo
    vpc_id      = aws_vpc.app1-vpc-D-Sao-Paulo.id
    peer_vpc_id = aws_vpc.app1-vpc-A-Tokyo.id
    peer_region = "ap-northeast-1"
  }