resource "aws_vpc" "my_vpc" {
  cidr_block       = "10.0.0.0/16"
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
  }
}


## allowing req to get all over the internet for my Public subnets
resource "aws_route_table" "my_Public_RT" {
  vpc_id = aws_vpc.my_vpc.id
  route{
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_gw.id
  }

  tags = {
    Name = "RT-public"
  }
}


## initialize of Public Subnets
resource "aws_subnet" "my_public_subnet-1" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = "us-east-1a"

  tags = {
    Name = "my_public_subnet_1"
  }
}

resource "aws_subnet" "my_public_subnet-2" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = "us-east-1b"

  tags = {
    Name = "my_public_subnet_2"
  }
}


resource "aws_subnet" "my_public_subnet-3" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.3.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = "us-east-1c"

  tags = {
    Name = "my_public_subnet_3"
  }
}


## initialize of Private Subnets
resource "aws_subnet" "my_private_subnet-1" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.4.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = "us-east-1a"

  tags = {
    Name = "my_private_subnet_1"
  }
}


resource "aws_subnet" "my_private_subnet-2" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.5.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = "us-east-1b"

  tags = {
    Name = "my_private_subnet_2"
  }
}


resource "aws_subnet" "my_private_subnet-3" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.6.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = "us-east-1c"

  tags = {
    Name = "my_private_subnet-3"
  }
}


## initialize of route table association for the Public RT 
resource "aws_route_table_association" "my-RTA-pub-a" {
  subnet_id = aws_subnet.my_public_subnet-1.id
  route_table_id = aws_route_table.my_Public_RT.id
}

resource "aws_route_table_association" "my-RTA-pub-b" {
  subnet_id = aws_subnet.my_public_subnet-2.id
  route_table_id = aws_route_table.my_Public_RT.id
}

resource "aws_route_table_association" "my-RTA-pub-c" {
  subnet_id = aws_subnet.my_public_subnet-3.id
  route_table_id = aws_route_table.my_Public_RT.id
}




