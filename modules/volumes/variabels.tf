// modules/volumes/variables.tf
variable "create_bucket" {
  type    = bool
  default = true
}

variable "bucket_name" {
  type        = string
  description = "S3 bucket name"
}

variable "instance_id" {
  type          = string
  description   = "instance id"
}

variable "instance_az" {
  type        = string
  description = "Availability Zone of the instance"
}