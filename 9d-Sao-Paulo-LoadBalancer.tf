resource "aws_lb" "app1_alb-SaoPaulo" {
  provider = aws.SaoPaulo
  name               = "app1-load-balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.app1-sg02-LB01-SaoPaulo.id]
  subnets            = [
    aws_subnet.public-sa-east-1a.id,
    aws_subnet.public-sa-east-1b.id,
    aws_subnet.public-sa-east-1c.id
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

resource "aws_lb_listener" "http-SaoPaulo" {
  provider = aws.SaoPaulo
  load_balancer_arn = aws_lb.app1_alb-SaoPaulo.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app1_tg_80-SaoPaulo.arn
  }
}

data "aws_acm_certificate" "cert-SaoPaulo" {
  domain   = "madibamaximus.click"
  statuses = ["ISSUED"]
  most_recent = true
}

/*
resource "aws_lb_listener" "https-SaoPaulo" {
  provider = aws.SaoPaulo
  load_balancer_arn = aws_lb.app1_alb-SaoPaulo.arn
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
output "lb_dns_name-SaoPaulo" {
  value       = aws_lb.app1_alb-SaoPaulo.dns_name
  description = "The DNS name of the App1 Load Balancer."
}
