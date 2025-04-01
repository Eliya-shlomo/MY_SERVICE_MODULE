output "vpc_id" {
  value = aws_vpc.my_vpc.id
}

output "my_public_subnets_id" {
  value = [
    aws_subnet.my_public_subnet_1.id,
    aws_subnet.my_public_subnet_2.id
  ]
}

output "sg_ssh_id" {
  value = ["${aws_security_group.allow-my_instance_ssh.id}"]
}

output "public_instance_ip" {
  value = ["${aws_instance.my_instance_example.public_ip}"]
}

