variable "instance_type" {
  default = "t2.micro"
}

variable "AMIS" {
  type = map(string)
  default = {
    us-east-1 = "ami-0b0ea68c435eb488d"
    us-east-2 = "ami-05803413c51f242b7"
    us-west-1 = "ami-0454207e5367abf01"
    us-west-2 = "ami-0688ba7eeeeefe3cd"
  }
}


## section for the connection to instance, his get the pub key. and the machine connect true it.
variable "path_to_private_key" {
  default = ".vpc_demo_keys/my_key"
}

variable "path_to_public_key" {
  default = ".vpc_demo_keys/my_key.pub"
}

variable "aws_region" {
  type        = string
  description = "AWS Region"
}


variable "public_1_id" {
  type        = string
  description = "Public subnet 1"
}

variable "public_2_id" {
  type        = string
  description = "Public subnet 2"
}

variable "private_1_id" {
  type        = string
  description = "Private subnet 1"
}

variable "private_2_id" {
  type        = string
  description = "Private subnet 2"
}


variable "elb_sg_id" {
  type = string
  description = "ID of the ELB security group"
}

variable "ssh_sg_id" {
  type = string
  description = "ID of the SSH security group"
}


variable "bucket_name" {
  type      = string
  description = "Name of the S3 bucket" 
}


variable "s3-my_bucket-role-instanceprofile_name" {
  type       = string
  description = "IAM instance profile name"
}
