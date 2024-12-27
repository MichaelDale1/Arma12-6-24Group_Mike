resource "aws_lb" "app1_alb-London" {
  provider = aws.london
  name               = "app1-load-balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.app1-sg02-LB01-London.id]
  subnets            = [
    aws_subnet.public-eu-west-2a.id,
    aws_subnet.public-eu-west-2b.id,
    aws_subnet.public-eu-west-2c.id
  ]
  enable_deletion_protection = false
#Lots of death and suffering here, make sure it's false

  tags = {
    Name    = "App1LoadBalancer"
    Service = "Multiapp"
    Owner   = "Mighty"
    Project = "Multiapp"
  }
}

resource "aws_lb_listener" "http-London" {
  provider = aws.london
  load_balancer_arn = aws_lb.app1_alb-London.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app1_tg_80-London.arn
  }
}

data "aws_acm_certificate" "cert-London" {
  domain   = "madibamaximus.click"
  statuses = ["ISSUED"]
  most_recent = true
}

/*
resource "aws_lb_listener" "https-London" {
  provider = aws.london
  load_balancer_arn = aws_lb.app1_alb-London.arn
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"  # or whichever policy suits your requirements
  certificate_arn   = data.aws_acm_certificate.cert.arn



  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app2_tg_443.arn
  }
}
*/
output "lb_dns_name-London" {
  value       = aws_lb.app1_alb-London.dns_name
  description = "The DNS name of the App1 Load Balancer."
}
