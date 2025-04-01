#Custom VPC for my Project
module "my-vpc" {
  source = "terraform-aws-modules/vpc/aws"
  
  name = "vpc${var.ENVIRONMENT}"
  cidr = var.cidr_vpc

  azs = ["${var.AWS_REGION}a", "${var.AWS_REGION}b"]
  private_subnets = ["10.0.1.0/24","10.0.2.0/24"]
  public_subnets  = ["10.0.3.0/24","10.0.4.0/24"]

  enable_nat_gateway = false
  enable_vpn_gateway = false

  tags = {
    Terraform = "true"
    Environment = var.ENVIRONMENT
  }
}

#Output Specific to Custom VPC
output "my_vpc_id" {
  description = "VPC ID"
  value = module.my-vpc.my_vpc_id
}

output "private_subnets" {
  description = "List of IDs of Private Subnets"
  value = module.my-vpc.private_subnets
}

output "public_subnets" {
  description = "List of IDs of Public Subnets"
  value = module.my-vpc.public_subnets
}