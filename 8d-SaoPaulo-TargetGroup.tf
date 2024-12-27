resource "aws_lb_target_group" "app1_tg_80-SaoPaulo" {
  provider = aws.SaoPaulo
  name     = "app1-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.app1-vpc-D-Sao-Paulo.id
  target_type = "instance"

  health_check {
    enabled             = true
    interval            = 30
    path                = "/"
    protocol            = "HTTP"
    healthy_threshold   = 5
    unhealthy_threshold = 2
    timeout             = 5
    matcher             = "200"
  }

  tags = {
    Name    = "App1TargetGroup"
    Service = "App1"
    Owner   = "Mighty"
    Project = "App1"
  }
}

#No need for a port 443 targeting group
/*resource "aws_lb_target_group" "app2_tg_443-SaoPaulo" {
  provider = aws.SaoPaulo
  name     = "app2tg443"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.app1-vpc-D-Sao-Paulo.id
  target_type = "instance"

  health_check {
    enabled             = true
    interval            = 30
    path                = "/"
    protocol            = "HTTP"
    healthy_threshold   = 5
    unhealthy_threshold = 2
    timeout             = 5
    matcher             = "200"
  }

  tags = {
    Name    = "app2_tg_443"
    Service = "App2"
    Owner   = "Mighty"
    Project = "App2"
  }
}
*/