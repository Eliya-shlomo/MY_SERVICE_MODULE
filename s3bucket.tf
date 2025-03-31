resource "aws_s3_bucket" "my-bucket-vpc-demo-eliyadev" {
  bucket = "my-bucket-vpc-demo-eliyadev"

  tags = {
    name = "my-bucket-vpc-demo-eliyadev"
  }
}

