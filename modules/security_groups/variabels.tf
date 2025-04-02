// modules/security_groups/variables.tf
variable "vpc_id" {
  type        = string
  description = "VPC ID to associate security groups"
}

variable "environment" {
  type        = string
  description = "Environment tag"
}

