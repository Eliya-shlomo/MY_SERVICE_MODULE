// modules/security_groups/outputs.tf
output "ssh_sg_id" {
  description = "ID of the SSH security group"
  value       = aws_security_group.ssh.id
}

output "mariadb_sg_id" {
  description = "ID of the MariaDB security group"
  value       = aws_security_group.mariadb.id
}

output "elb_sg_id" {
  description = "ID of the ELB security group"
  value       = aws_security_group.elb.id
}

output "instance_sg_id" {
  description = "ID of the instance security group"
  value       = aws_security_group.instance.id
}
