# Variables

#####################
#######PROVIDER######
#####################
variable "AWS_REGION" {
  description = "The AWS region to deploy resources"
  type        = string
  default     = "us-east-1"

  validation {
    condition     = contains(["us-east-1", "us-east-2"], var.aws_region)
    error_message = "Unsupported AWS Region specified. Supported regions include: us-east-1, us-east-2, us-west-1, us-west-2."
  }
}

variable "aws_access_key" {
  description = "AWS access key"
  type        = string
  sensitive   = true
}

variable "aws_secret_key" {
  description = "AWS secret key"
  type        = string
  sensitive   = true
}




#####################
#########VPC#########
#####################
variable "ENVIRONMENT" {
  description = "the Environment That the Terraform will be Executing"
  default = "Development"
}

variable "cidr_vpc" {
  description = "CIDR block for the VPC"
  default = "10.0.0.0/16"
}

variable "cidr_subnet_pub-1" {
  description = "CIDR block for the subnet"
  default = "10.0.1.0/24"
}

variable "cidr_subnet_pub-2" {
  description = "CIDR block for the subnet"
  default = "10.0.2.0/24"
}

variable "cidr_subnet_priv-1" {
  description = "CIDR block for the subnet"
  default = "10.0.3.0/24"
}

variable "cidr_subnet_priv-2" {
  description = "CIDR block for the subnet"
  default = "10.0.4.0/24"
}







#####################
######INSTANCES######
#####################
variable "instance_type" {
  description = "Type for aws EC2 instance"
  default = "t2.micro"
}

## section for the connection to instance, his get the pub key. and the machine connect true it.
variable "path_to_private_key" {
  default = ".vpc_demo_keys/my_key"
}

variable "path_to_public_key" {
  default = ".vpc_demo_keys/my_key.pub"
}



##AMIs for each of the region, if for some reason the region has been changed
variable "AMIS" {
  type = map(string)
  default = {
    us-east-1 = "ami-0b0ea68c435eb488d"
    us-east-2 = "ami-05803413c51f242b7"
    us-west-1 = "ami-0454207e5367abf01"
    us-west-2 = "ami-0688ba7eeeeefe3cd"
  }
}