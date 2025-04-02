// modules/vpc/variables.tf

variable "aws_access_key" {
  description = "AWS access key"
  type = string
  sensitive = true
}

variable "aws_secret_key" {
  description = "AWS secret key"
  type = string
  sensitive = true
}

variable "cidr_block" {
  type        = string
  description = "CIDR block for the VPC"
}

variable "public_subnet_1" {
  type        = string
  description = "CIDR block for public subnet 1"
}

variable "public_subnet_2" {
  type        = string
  description = "CIDR block for public subnet 2"
}

variable "private_subnet_1" {
  type        = string
  description = "CIDR block for private subnet 1"
}

variable "private_subnet_2" {
  type        = string
  description = "CIDR block for private subnet 2"
}

variable "aws_region" {
  type        = string
  description = "AWS Region"
}

variable "environment" {
  type        = string
  description = "Environment name for tagging"
}

variable "public_route_table_id" {
  type        = string
  description = "Route table ID for public subnets"
}

variable "private_route_table_id" {
  type        = string
  description = "Route table ID for private subnets"
}

variable "cidr_vpc" {
  type        = string
  description = "VPC CIDR block"
}

