// modules/volumes/outputs.tf
output "bucket_name" {
  description = "Name of the S3 bucket"
  value       = aws_s3_bucket.my-bucket-vpc-demo-eliyadev.bucket
}


output "s3-my_bucket-role-instanceprofile_name" {
  description = "IAM instance profile name"
  value       = aws_iam_instance_profile.s3-my_bucket-role-instanceprofile.name
}

