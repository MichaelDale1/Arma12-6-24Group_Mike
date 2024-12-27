resource "aws_security_group" "app1-sg01-servers-TG01-SG01-80-California" {
  provider = aws.California
  name        = "app1-sg01-servers-TG01-SG01-80-California"
  description = "app1-sg01-servers-TG01-SG01-80-California"
  vpc_id      = aws_vpc.app1-vpc-G-California.id

  ingress {
    description = "MyHomePage"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }



  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "app1-sg01-servers-TG01-SG01-80-California"
    Service = "application1"
    Owner   = "Maximus"
    Planet  = "Mighty"
  }

}





resource "aws_security_group" "app1-sg02-LB01-California" {
  provider = aws.California
  name        = "app1-sg02-LB01-California"
  description = "app1-sg02-LB01-California"
  vpc_id      = aws_vpc.app1-vpc-G-California.id

  ingress {
    description = "MyHomePage"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

ingress {
    description = "Secure"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "app1-sg02-LB01"
    Service = "application1"
    Owner   = "Maximus"
    Planet  = "Mighty"
  }

}

#We don't currently need port 443 
/*
resource "aws_security_group" "app1-sg03-securG-servers-TG02-443-California" {
  provider = aws.California
  name        = "app1-sg03-securG-servers-TG02-443-California"
  description = "app1-sg03-securG-servers-TG02-443-California"
  vpc_id      = aws_vpc.app1-vpc-G-California.id

  ingress {
    description = "MyHomePage"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

ingress {
    description = "Secure"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "app1-sg03-securG-servers-TG02-443-California"
    Service = "application1"
    Owner   = "Maximus"
    Planet  = "Mighty"
  }

}
*/