// modules/volumes/variables.tf
variable "bucket_name" {
  type        = string
  description = "S3 bucket name"
}

variable "instance_id" {
  type          = string
  description   = "instance id"
}