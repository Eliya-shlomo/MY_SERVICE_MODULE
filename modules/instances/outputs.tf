output "instance_id" {
  value = aws_instance.this.id
}

output "instance_az" {
  value = aws_instance.this.availability_zone
}
