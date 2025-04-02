########################################################
#########cloud watch for AWS autoscaling group##########
########################################################

#Autoscaling Configuration policy - Scaling Alarm. activate more instances
resource "aws_autoscaling_policy" "my-cpu-policy-scaleup" {
  name = "my-cpu-policy"
  autoscaling_group_name = var.autoscaling__group_name
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
    "AutoScalingGroupName" = var.autoscaling__group_name
  }

  actions_enabled = true
  alarm_actions = [aws_autoscaling_policy.my-cpu-policy-scaleup.arn]

}

#Auto Descaling Policy
resource "aws_autoscaling_policy" "my-cpu-policy-scaledown" {
  name = "my-cpu-policy-scaledown"
  autoscaling_group_name = var.autoscaling__group_name
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
    "AutoScalingGroupName" = var.autoscaling__group_name
  }

  actions_enabled = true
  alarm_actions = [aws_autoscaling_policy.my-cpu-policy-scaledown.arn]

}




########################################################
#############cloud watch for AWS instance###############
########################################################