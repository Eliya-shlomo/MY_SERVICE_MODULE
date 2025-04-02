variable "aws_access_key" {
  type        = string
  sensitive   = true
  description = "AWS access key"
}

variable "aws_secret_key" {
  type        = string
  sensitive   = true
  description = "AWS secret key"
}

variable "aws_region" {
  type        = string
  description = "AWS Region to deploy resources"
}

variable "environment" {
  type        = string
  description = "Environment name (e.g. development, production)"
}

variable "vpc_cidr" {
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

variable "bucket_name" {
  type        = string
  description = "Name of the S3 bucket"
}

variable "path_to_public_key" {
  type        = string
  description = "Path to public key file"
}

variable "instance_type" {
  type        = string
  description = "Type of EC2 instance"
}

variable "AMIS" {
  type        = map(string)
  description = "Map of AMIs per region"
}
