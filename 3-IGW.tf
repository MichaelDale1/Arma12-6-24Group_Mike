resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.app1-vpc-A-Tokyo.id

  tags = {
    Name    = "app1_IG"
    Service = "application1"
    Owner   = "Mighty"
    Planet  = "Maximus"
  }
}