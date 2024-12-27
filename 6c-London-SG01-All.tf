resource "aws_security_group" "app1-sg01-servers-TG01-SG01-80-London" {
  provider = aws.london
  name        = "app1-sg01-servers-TG01-SG01-80-London"
  description = "app1-sg01-servers-TG01-SG01-80-London"
  vpc_id      = aws_vpc.app1-vpc-C-London.id

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
    Name    = "app1-sg01-servers-TG01-SG01-80-London"
    Service = "application1"
    Owner   = "Maximus"
    Planet  = "Mighty"
  }

}





resource "aws_security_group" "app1-sg02-LB01-London" {
  provider = aws.london
  name        = "app1-sg02-LB01-London"
  description = "app1-sg02-LB01-London"
  vpc_id      = aws_vpc.app1-vpc-C-London.id

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
resource "aws_security_group" "app1-sg03-secure-servers-TG02-443-London" {
  provider = aws.london
  name        = "app1-sg03-secure-servers-TG02-443-London"
  description = "app1-sg03-secure-servers-TG02-443-London"
  vpc_id      = aws_vpc.app1-vpc-C-London.id

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
    Name    = "app1-sg03-secure-servers-TG02-443-London"
    Service = "application1"
    Owner   = "Maximus"
    Planet  = "Mighty"
  }

}
*/