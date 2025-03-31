#Roles to access the AWS S3 Bucket
resource "aws_iam_role" "s3-my_bucket-role" {
  name               = "s3-my_bucket-role"
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

#Policy to attach the S3 Bucket Role
resource "aws_iam_role_policy" "s3-my_bucket-role-policy" {
  name = "s3-my_bucket-role-policy"
  role = aws_iam_role.s3-my_bucket-role.id
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
              "s3:*"
            ],
            "Resource": [
              "arn:aws:s3:::my-bucket-vpc-demo-eliyadev",
              "arn:aws:s3:::my-bucket-vpc-demo-eliyadev/*"
            ]
        }
    ]
}
EOF

}

#Instance identifier
resource "aws_iam_instance_profile" "s3-my_bucket-role-instanceprofile" {
  name = "s3-my_bucket-role"
  role = aws_iam_role.s3-my_bucket-role.name
}