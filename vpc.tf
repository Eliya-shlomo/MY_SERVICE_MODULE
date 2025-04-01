resource "aws_vpc" "my_vpc" {
  cidr_block       = var.cidr_vpc
  instance_tenancy = "default"
  enable_dns_support = "true"
  enable_dns_hostnames = "true"

  tags = {
    Name = "my_vpc"
  }
}

## initialize of my internet gateway
resource "aws_internet_gateway" "my_gw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "my_gw"
    Environment = var.environment_tag
  }
}



## initialize of Public Subnets
resource "aws_subnet" "my_public_subnet-1" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = var.cidr_subnet_pub-1
  map_public_ip_on_launch = "true"
  availability_zone = "us-east-1a"

  tags = {
    Name = "my_public_subnet_1"
  }
}

resource "aws_subnet" "my_public_subnet-2" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = var.cidr_subnet_pub-2
  map_public_ip_on_launch = "true"
  availability_zone = "us-east-1b"

  tags = {
    Name = "my_public_subnet_2"
  }
}




## initialize of Private Subnets
resource "aws_subnet" "my_private_subnet-1" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = var.cidr_subnet_priv-1
  map_public_ip_on_launch = "true"
  availability_zone = "us-east-1a"

  tags = {
    Name = "my_private_subnet_1"
  }
}


resource "aws_subnet" "my_private_subnet-2" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = var.cidr_subnet_priv-2
  map_public_ip_on_launch = "true"
  availability_zone = "us-east-1b"

  tags = {
    Name = "my_private_subnet_2"
  }
}




## initialize of route table association for the Public RT and Public Subnets
resource "aws_route_table_association" "my-RTA-pub-a" {
  subnet_id = aws_subnet.my_public_subnet-1.id
  route_table_id = aws_route_table.my_Public_RT.id
}

resource "aws_route_table_association" "my-RTA-pub-b" {
  subnet_id = aws_subnet.my_public_subnet-2.id
  route_table_id = aws_route_table.my_Public_RT.id
}



## initialize of route table association for the Private RT and Private Subnets 
resource "aws_route_table_association" "my-private-1-a" {
  subnet_id = aws_subnet.my_private_subnet-1.id
  route_table_id = aws_route_table.my_Private_RT.id
}

resource "aws_route_table_association" "my-private-2-b" {
  subnet_id = aws_subnet.my_private_subnet-2.id
  route_table_id = aws_route_table.my_Private_RT.id
}



