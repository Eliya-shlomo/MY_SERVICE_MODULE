variable "public_1_id" {
  type = string
  description = "Public subnet 1 id"
}

variable "public_2_id" {
  type = string
  description = "Public subnet 2 id"
}

variable "elb_sg_id" {
  type = string
  description = "ID of the ELB security group"
}

variable "ssh_sg_id" {
  type = string
  description = "ID of the SSH security group"
}