#s3 Bucket Creation
resource "aws_s3_bucket" "my-bucket-vpc-demo-eliyadev" {
  count  = var.create_bucket ? 1 : 0
  bucket = var.bucket_name
  
  tags = {
    name = "${var.bucket_name}"
  }
}


#Roles to access the AWS S3 Bucket
resource "aws_iam_role" "s3-my_bucket-role" {
  count = var.create_bucket ? 1 : 0
  name  = "s3-my_bucket-role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "s3-my_bucket-role-policy" {
  count = var.create_bucket ? 1 : 0
  name  = "s3-my_bucket-role-policy"
  role  = aws_iam_role.s3-my_bucket-role[count.index].id

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": ["s3:*"],
      "Resource": [
        "arn:aws:s3:::${var.bucket_name}",
        "arn:aws:s3:::${var.bucket_name}/*"
      ]
    }
  ]
}
EOF
}

resource "aws_iam_instance_profile" "s3-my_bucket-role-instanceprofile" {
  count = var.create_bucket ? 1 : 0
  name  = "s3-my_bucket-role"
  role  = aws_iam_role.s3-my_bucket-role[count.index].name
}




#EBS Creation
resource "aws_ebs_volume" "ebs-volume-1" {
  availability_zone = var.instance_az
  size = 50
  type = "gp2"

  tags = {
    Name = "Secondary Volume Disk"
  }  
}

##Attach EBS volume with AWS instance
resource "aws_volume_attachment" "ebs-volume-1-attachment" {
  device_name = "/dev/xvdh"
  volume_id = aws_ebs_volume.ebs-volume-1.id
  instance_id = var.instance_id
}
