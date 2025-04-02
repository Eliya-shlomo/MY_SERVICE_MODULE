// environments/development/main.tf

module "routes" {
  source         = "../../modules/routable"
  gateway_id = ""
  vpc_id         = module.vpc.vpc_id
  nat_gateway_id = module.vpc.nat_gateway_id
}

module "security_groups" {
  source         = "../../modules/security_groups"
  environment    = var.environment
  vpc_id         = module.vpc.vpc_id
}

module "elb" {
  source         = "../../modules/elb"
  public_1_id    =  ""
  public_2_id    = ""
  elb_sg_id      = module.security_groups.elb_sg_id
  ssh_sg_id      = module.security_groups.ssh_sg_id
}

module "vpc" {
  source              = "../../modules/vpc"
  cidr_block          = var.vpc_cidr
  cidr_vpc = var.vpc_cidr
  aws_access_key = var.aws_access_key
  aws_secret_key = var.aws_secret_key
  route_table_public_id  = module.routes.route_table_public_id
  route_table_private_id = module.routes.route_table_private_id
  public_subnet_1     = var.public_subnet_1
  public_subnet_2     = var.public_subnet_2
  private_subnet_1    = var.private_subnet_1
  private_subnet_2    = var.private_subnet_2
  aws_region          = var.aws_region
  environment         = var.environment
}

module "volumes" {
  source      = "../../modules/volumes"
  bucket_name = var.bucket_name
  instance_id = module.instance.instance_id
  instance_az = module.instance.instance_az
}

module "rds" {
  source       = "../../modules/rds"
  private_1_id = module.vpc.private_1_id
  private_2_id = module.vpc.private_2_id

}


module "instance" {
  source = "../../modules/instances"
  private_1_id = module.vpc.private_1_id
  private_2_id = module.vpc.private_2_id
  elb_sg_id    = module.security_groups.elb_sg_id
  s3-my_bucket-role-instanceprofile_name = module.volumes.s3-my_bucket-role-instanceprofile_name
  aws_region  = var.aws_region
  bucket_name = var.bucket_name
  ssh_sg_id   = module.security_groups.ssh_sg_id
  public_2_id = module.vpc.public_1_id
  public_1_id = module.vpc.public_2_id
}


output "instance_id" {
  value = module.instance.instance_id
}