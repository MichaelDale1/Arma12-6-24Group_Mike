resource "aws_ec2_transit_gateway" "TGW_Armageddon1-Tokyo" {
    description =  "Securely transfer data to Japan via Tokyo"
    default_route_table_association = "disable"
    default_route_table_propagation = "disable"

    tags = {
        Name = "TGW_For_Japan"
    } 
}

  #Adding routes from Tokyo VPC to other VPCS via Transit Gateway/ Don't add here becuase route was already set.
  
resource "aws_default_route_table" "VPC_A-Tokyo_RT" {
default_route_table_id = aws_vpc.app1-vpc-A-Tokyo.default_route_table_id
  
  route {
  cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.Tokyo_igw.id
  }
  
  
  route {
    cidr_block = var.tokyo_cidr_blocks[0].cidr_block
    transit_gateway_id = aws_ec2_transit_gateway.TGW_Armageddon1-Tokyo.id
  }


  #from Tokyo to NY via TGW
    route {

    cidr_block = var.ny_cidr_blocks[0].cidr_block
    transit_gateway_id = aws_ec2_transit_gateway.TGW_Armageddon1-Tokyo.id
    }
    
  

  #from Tokyo to London via TGW
    route {

    cidr_block = var.london_cidr_blocks[0].cidr_block
    transit_gateway_id = aws_ec2_transit_gateway.TGW_Armageddon1-Tokyo.id
    }

  #from Tokyo to Sao Paulo via TGW
    route {

    cidr_block = var.SaoPaulo_cidr_blocks[0].cidr_block
    transit_gateway_id = aws_ec2_transit_gateway.TGW_Armageddon1-Tokyo.id
    }

  #from Tokyo to Sydney via TGW
    route {

    cidr_block = var.Sydney_cidr_blocks[0].cidr_block
    transit_gateway_id = aws_ec2_transit_gateway.TGW_Armageddon1-Tokyo.id
    }

  #from Tokyo to Hong Kong via TGW
    route {

    cidr_block = var.HongKong_cidr_blocks[0].cidr_block
    transit_gateway_id = aws_ec2_transit_gateway.TGW_Armageddon1-Tokyo.id
    }

  #from Tokyo to California via TGW
    route {

    cidr_block = var.california_cidr_blocks[0].cidr_block
    transit_gateway_id = aws_ec2_transit_gateway.TGW_Armageddon1-Tokyo.id
    }
tags = {
Name = "VPC_A-Tokyo_RT"
}

}


resource "aws_ec2_transit_gateway_vpc_attachment" "TGA_VPC_A-Tokyo" {
    /*provider = aws.tokyo*/
    subnet_ids = [aws_subnet.public-ap-northeast-1a.id , aws_subnet.public-ap-northeast-1c.id , aws_subnet.public-ap-northeast-1d.id] 
    transit_gateway_id = aws_ec2_transit_gateway.TGW_Armageddon1-Tokyo.id
    vpc_id = aws_vpc.app1-vpc-A-Tokyo.id

    tags = {
        Name = "TGA_VPC_A_Tokyo"
    }
}

#Don't need connections from alternate VPCs to each other
/*
resource "aws_ec2_transit_gateway_route_table" "TGW_RTB_VPC_NYtoLondon" {
    transit_gateway_id = aws_ec2_transit_gateway.TGW_Armageddon1-Tokyo.id

    tags ={
     "name" = "TGW_RTB_VPC_NYtoLondon"   
    }
}

resource "aws_ec2_transit_gateway_route" "TGW_RTB_VPC_NY_London_Route_1" {
destination_cidr_block = "0.0.0.0/0"
transit_gateway_attachment_id = aws_ec2_transit_gateway_vpc_attachment.TGA_VPC_A-Tokyo.id
transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.TGW_RTB_VPC_NYtoLondon.id
}

resource "aws_ec2_transit_gateway_route_table_association" "TGW_RTB_VPC_NY_London_Association_1" {
transit_gateway_attachment_id = aws_ec2_transit_gateway_vpc_attachment.TGA_VPC_B-NY.id
transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.TGW_RTB_VPC_NYtoLondon.id
}

resource "aws_ec2_transit_gateway_route_table_association" "TGW_RTB_VPC_NY_London_Association_2" {
transit_gateway_attachment_id = aws_ec2_transit_gateway_vpc_attachment.TGA_VPC_C_London.id
transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.TGW_RTB_VPC_NYtoLondon.id
}
*/

resource "aws_ec2_transit_gateway_route_table" "TGW_RTB_VPC_A-Tokyo" {
  transit_gateway_id = aws_ec2_transit_gateway.TGW_Armageddon1-Tokyo.id

  tags = {
    "name" = "TGW_RTB_VPC_A-Tokyo"
  }
}

resource "aws_ec2_transit_gateway_route" "TGW_RTB_VPC_A-Tokyo_Route_1-NY" {
  destination_cidr_block         = var.ny_cidr_blocks[0].cidr_block
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.TGA_VPC_B-NY.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.TGW_RTB_VPC_A-Tokyo.id
}

resource "aws_ec2_transit_gateway_route" "TGW_RTB_VPC_A-Tokyo_Route_2-London" {
  destination_cidr_block         = var.london_cidr_blocks[0].cidr_block
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.TGA_VPC_C-London.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.TGW_RTB_VPC_A-Tokyo.id
}

resource "aws_ec2_transit_gateway_route" "TGW_RTB_VPC_A-Tokyo_Route_3-Sao-Paulo" {
  destination_cidr_block         = var.SaoPaulo_cidr_blocks[0].cidr_block
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.TGA_VPC_D-Sao-Paulo.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.TGW_RTB_VPC_A-Tokyo.id
}

resource "aws_ec2_transit_gateway_route" "TGW_RTB_VPC_A-Tokyo_Route_4-Sydney" {
  destination_cidr_block         = var.Sydney_cidr_blocks[0].cidr_block
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.TGA_VPC_E-Sydney.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.TGW_RTB_VPC_A-Tokyo.id
}

resource "aws_ec2_transit_gateway_route" "TGW_RTB_VPC_A-Tokyo_Route_5-Hong-Kong" {
  destination_cidr_block         = var.HongKong_cidr_blocks[0].cidr_block
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.TGA_VPC_F-Hong-Kong.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.TGW_RTB_VPC_A-Tokyo.id
}

resource "aws_ec2_transit_gateway_route" "TGW_RTB_VPC_A-Tokyo_Route_6-California" {
  destination_cidr_block         = var.california_cidr_blocks[0].cidr_block
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.TGA_VPC_G-California.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.TGW_RTB_VPC_A-Tokyo.id
}

resource "aws_ec2_transit_gateway_route_table_association" "TGW_RTB_VPC_A-Tokyo_Association_1" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.TGA_VPC_A-Tokyo.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.TGW_RTB_VPC_A-Tokyo.id
}

  
resource "aws_vpc_peering_connection_accepter" "Tokyo-Accepts-NY" {
    /*provider                  = aws.accepter*/
    vpc_peering_connection_id = aws_vpc_peering_connection.Request-NY-to-Tokyo-Peering.id
    auto_accept               = true
  }

  
resource "aws_vpc_peering_connection_accepter" "Tokyo-Accepts-London" {
    /*provider                  = aws.accepter*/
    vpc_peering_connection_id = aws_vpc_peering_connection.Request-London-to-Tokyo-Peering.id
    auto_accept               = true
  }

    resource "aws_vpc_peering_connection_accepter" "Tokyo-Accepts-Sao-Paulo" {
    /*provider                  = aws.accepter*/
    vpc_peering_connection_id = aws_vpc_peering_connection.Request-Sao-Paulo-to-Tokyo-Peering.id
    auto_accept               = true
  }

    resource "aws_vpc_peering_connection_accepter" "Tokyo-Accepts-Sydney" {
    /*provider                  = aws.accepter*/
    vpc_peering_connection_id = aws_vpc_peering_connection.Request-Sydney-to-Tokyo-Peering.id
    auto_accept               = true
  }

  
  resource "aws_vpc_peering_connection_accepter" "Tokyo-Accepts-Hong-Kong" {
    /*provider                  = aws.accepter*/
    vpc_peering_connection_id = aws_vpc_peering_connection.Request-Hong-Kong-to-Tokyo-Peering.id
    auto_accept               = true
  }

    resource "aws_vpc_peering_connection_accepter" "Tokyo-Accepts-California" {
    /*provider                  = aws.accepter*/
    vpc_peering_connection_id = aws_vpc_peering_connection.Request-California-to-Tokyo-Peering.id
    auto_accept               = true
  }

  
#Create an IAM Role for Armageddon 1 (Dec 2024) flow logs
resource "aws_iam_role" "role_Arm1_flow_logs" {
  name = "role_lab_flow_logs"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "vpc-flow-logs.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

#Create an IAM Role policy for Armageddon 1 flow logs 
resource "aws_iam_role_policy" "IAM_Role_Policy_for_Arm1_Flow_Log" {
  name = "IAM_Role_Policy_for_Flow_Log"
  role = aws_iam_role.role_Arm1_flow_logs.id

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents",
        "logs:DescribeLogGroups",
        "logs:DescribeLogStreams"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}


#Create a Cloudwatch log group for Armageddon 1
resource "aws_cloudwatch_log_group" "Arm1_Transit_Gateway_Log_Group" {
  name              = "Arm1_Transit_Gateway_Log_Group"
}


#Create a flow log for the Tokyo VPC 
resource "aws_flow_log" "flow_log_tgw_lab" {
  iam_role_arn    = aws_iam_role.role_Arm1_flow_logs.arn
  log_destination = aws_cloudwatch_log_group.Arm1_Transit_Gateway_Log_Group.arn
  traffic_type    = "ALL"
  vpc_id          = aws_vpc.app1-vpc-A-Tokyo.id

  tags = {
    Name = "flow_log_tgw_Tokyo"
  }
}








