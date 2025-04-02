output "bucket_name" {
  description = "Name of the S3 bucket"
  value       = try(aws_s3_bucket.my-bucket-vpc-demo-eliyadev[0].bucket, "")
}

output "my-bucket-vpc-demo-eliyadev_id" {
  description = "Full S3 bucket object"
  value       = try(aws_s3_bucket.my-bucket-vpc-demo-eliyadev[0], null)
}

output "s3-my_bucket-role-instanceprofile_name" {
  description = "IAM instance profile name"
  value       = try(aws_iam_instance_profile.s3-my_bucket-role-instanceprofile[0].name, "")
}

output "s3-my_bucket-role-instanceprofile" {
  description = "Name of the S3 bucket"
  value       = try(aws_s3_bucket.my-bucket-vpc-demo-eliyadev[0].bucket, "")
}
