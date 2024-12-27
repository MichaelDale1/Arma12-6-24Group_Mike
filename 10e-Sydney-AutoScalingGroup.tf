resource "aws_autoscaling_group" "app1_asg_80-Sydney" {
  provider = aws.sydney
  name_prefix           = "app1-auto-scaling-group-"
  min_size              = 1
  max_size              = 4
  desired_capacity      = 3
  vpc_zone_identifier   = [
    aws_subnet.private-ap-southeast-2a.id,
    aws_subnet.private-ap-southeast-2b.id,
    aws_subnet.private-ap-southeast-2c.id
  ]
  health_check_type          = "ELB"
  health_check_grace_period  = 300
  force_delete               = true
  target_group_arns          = [aws_lb_target_group.app1_tg_80-Sydney.arn]

  launch_template {
    id      = aws_launch_template.app1_LT_80-Sydney.id
    version = "$Latest"
  }

  enabled_metrics = ["GroupMinSize", "GroupMaxSize", "GroupDesiredCapacity", "GroupInServiceInstances", "GroupTotalInstances"]

  # Instance protection for launching
  initial_lifecycle_hook {
    name                  = "instance-protection-launch"
    lifecycle_transition  = "autoscaling:EC2_INSTANCE_LAUNCHING"
    default_result        = "CONTINUE"
    heartbeat_timeout     = 60
    notification_metadata = "{\"key\":\"value\"}"
  }

  # Instance protection for terminating
  initial_lifecycle_hook {
    name                  = "scale-in-protection"
    lifecycle_transition  = "autoscaling:EC2_INSTANCE_TERMINATING"
    default_result        = "CONTINUE"
    heartbeat_timeout     = 300
  }

  tag {
    key                 = "Name"
    value               = "app1-instance-80"
    propagate_at_launch = true
  }

  tag {
    key                 = "Environment"
    value               = "Production"
    propagate_at_launch = true
  }
}


# Auto Scaling Policy
resource "aws_autoscaling_policy" "app1_scaling_policy_80-Sydney" {
  provider = aws.sydney
  name                   = "app1-cpu-target"
  autoscaling_group_name = aws_autoscaling_group.app1_asg_80-Sydney.name

  policy_type = "TargetTrackingScaling"
  estimated_instance_warmup = 120

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = 75.0
  }
}

# Enabling instance scale-in protection
resource "aws_autoscaling_attachment" "app1_asg_80_attachment-Sydney" {
  provider = aws.sydney
  autoscaling_group_name = aws_autoscaling_group.app1_asg_80-Sydney.name
  alb_target_group_arn   = aws_lb_target_group.app1_tg_80-Sydney.arn
}

/*
resource "aws_autoscaling_group" "app2_asg_443-Sydney" {
  provider = aws.sydney
  name_prefix           = "app1-auto-scaling-group-"
  min_size              = 1
  max_size              = 4
  desired_capacity      = 3
  vpc_zone_identifier   = [
    aws_subnet.private-ap-southeast-2a.id,
    aws_subnet.private-ap-southeast-2b.id,
    aws_subnet.private-ap-southeast-2c.id
  ]
  health_check_type          = "ELB"
  health_check_grace_period  = 300
  force_delete               = true
  target_group_arns          = [aws_lb_target_group.app2_tg_443-Sydney.arn]

  launch_template {
    id      = aws_launch_template.app2_LT_443-Sydney.id
    version = "$Latest"
  }

  enabled_metrics = ["GroupMinSize", "GroupMaxSize", "GroupDesiredCapacity", "GroupInServiceInstances", "GroupTotalInstances"]

  # Instance protection for launching
  initial_lifecycle_hook {
    name                  = "instance-protection-launch"
    lifecycle_transition  = "autoscaling:EC2_INSTANCE_LAUNCHING"
    default_result        = "CONTINUE"
    heartbeat_timeout     = 60
    notification_metadata = "{\"key\":\"value\"}"
  }

  # Instance protection for terminating
  initial_lifecycle_hook {
    name                  = "scale-in-protection"
    lifecycle_transition  = "autoscaling:EC2_INSTANCE_TERMINATING"
    default_result        = "CONTINUE"
    heartbeat_timeout     = 300
  }

  tag {
    key                 = "Name"
    value               = "app2_443"
    propagate_at_launch = true
  }

  tag {
    key                 = "Environment"
    value               = "Production"
    propagate_at_launch = true
  }
}


# Auto Scaling Policy
resource "aws_autoscaling_policy" "app2_scaling_policy_443-Sydney" {
  provider = aws.sydney
  name                   = "app2-cpu-target"
  autoscaling_group_name = aws_autoscaling_group.app2_asg_443-Sydney.name

  policy_type = "TargetTrackingScaling"
  estimated_instance_warmup = 120

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = 75.0
  }
}

# Enabling instance scale-in protection
resource "aws_autoscaling_attachment" "app2_asg_443_attachment-Sydney" {
  provider = aws.sydney
  autoscaling_group_name = aws_autoscaling_group.app2_asg_443-Sydney.name
  alb_target_group_arn   = aws_lb_target_group.app2_tg_443-Sydney.arn
}
*/