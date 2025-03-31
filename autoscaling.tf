##AutoScaling Lunch Configuration
resource "aws_launch_template" "my-launchtemplate" {
  name_prefix = "my-launchtemplate"
  image_id = lookup(var.AMIS,var.aws_region)
  instance_type = "t2.micro"
  key_name = aws_key_pair.key_connect_instance.key_name
  vpc_security_group_ids = [aws_security_group.allow-my_instance_ssh.id]

}

#Autoscaling Group
resource "aws_autoscaling_group" "my-launchtemplate-group" {
  name = "my-launchtemplate-group"
  vpc_zone_identifier = [aws_subnet.my_public_subnet-1.id]
  min_size = 1 
  max_size = 2
  health_check_type = "EC2"
  force_delete = true
  launch_template {
    id      = aws_launch_template.my-launchtemplate.id
    version = "$Latest"
  }
  
  tag{
    key = "Name"
    value = "My custom EC2 instance - Provide by The autoscaling group"
    propagate_at_launch = true
  }
}


#Autoscaling Configuration policy - Scaling Alarm. activate more instances
resource "aws_autoscaling_policy" "my-cpu-policy-scaleup" {
  name = "my-cpu-policy"
  autoscaling_group_name = aws_autoscaling_group.my-launchtemplate-group.name
  adjustment_type = "ChangeInCapacity"
  scaling_adjustment = "1" //to add one
  cooldown = "200"
  policy_type = "SimpleScaling"
}

#Cloud Watch Monitoring - Scaling Up
resource "aws_cloudwatch_metric_alarm" "my-cpu-alarm-up" {
  alarm_name = "my-cpu-alarm-up"
  alarm_description = "Alarm once CPU Uses Increase"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods = "2"
  metric_name = "CPUUtilization"
  namespace = "AWS/EC2"
  period = "120"
  statistic = "Average"
  threshold = "40"

  dimensions = {
    "AutoScalingGroupName" = aws_autoscaling_group.my-launchtemplate-group.name
  }

  actions_enabled = true
  alarm_actions = [aws_autoscaling_policy.my-cpu-policy-scaleup.arn]

}

#Auto Descaling Policy
resource "aws_autoscaling_policy" "my-cpu-policy-scaledown" {
  name = "my-cpu-policy-scaledown"
  autoscaling_group_name = aws_autoscaling_group.my-launchtemplate-group.name
  adjustment_type = "ChangeInCapacity"
  scaling_adjustment = "-1" //decrease by one
  cooldown = "200"
  policy_type = "SimpleScaling"
}


#Cloud Watch Monitoring - Scaling Down
resource "aws_cloudwatch_metric_alarm" "my-cpu-alarm-down" {
  alarm_name = "my-cpu-alarm-down"
  alarm_description = "Alarm once CPU Uses Increase"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods = "2"
  metric_name = "CPUUtilization"
  namespace = "AWS/EC2"
  period = "120"
  statistic = "Average"
  threshold = "20"

  dimensions = {
    "AutoScalingGroupName" = aws_autoscaling_group.my-launchtemplate-group.name
  }

  actions_enabled = true
  alarm_actions = [aws_autoscaling_policy.my-cpu-policy-scaledown.arn]

}