variable "vpc_id" {
  description = "${environment} VPC ID"
  type        = string
}

variable "nat_gateway_id" {
  description = "NAT Gateway to associate with private routes"
  type        = string
}

variable "gateway_id" {
  description = "${environment} VPC ID"
  type        = string
}

