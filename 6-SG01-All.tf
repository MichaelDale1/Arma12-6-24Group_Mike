resource "aws_security_group" "app1-sg01-servers-TG01-SG01-80" {
  name        = "app1-sg01-servers-TG01-SG01-80"
  description = "app1-sg01-servers-TG01-SG01-80"
  vpc_id      = aws_vpc.app1-vpc-A-Tokyo.id

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
    Name    = "app1-sg01-servers-TG01-SG01-80"
    Service = "application1"
    Owner   = "Maximus"
    Planet  = "Mighty"
  }

}





resource "aws_security_group" "app1-sg02-LB01" {
  name        = "app1-sg02-LB01"
  description = "app1-sg02-LB01"
  vpc_id      = aws_vpc.app1-vpc-A-Tokyo.id

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


resource "aws_security_group" "app1-sg03-secure-servers-TG02-443" {
  name        = "app1-sg03-secure-servers-TG02-443"
  description = "app1-sg03-secure-servers-TG02-443"
  vpc_id      = aws_vpc.app1-vpc-A-Tokyo.id

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
    Name    = "app1-sg03-secure-servers-TG02-443"
    Service = "application1"
    Owner   = "Maximus"
    Planet  = "Mighty"
  }

}
