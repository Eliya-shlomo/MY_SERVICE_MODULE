output "autoscaling__group_id" {
  value = aws_autoscaling_group.this.id
}

output "autoscaling__group_name" {
  value = aws_autoscaling_group.this.name
}