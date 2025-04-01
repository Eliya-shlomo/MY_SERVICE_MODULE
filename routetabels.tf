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


resource "aws_route_table" "my_Private_RT" {
  vpc_id = aws_vpc.my_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.my-nat-gw.id
  }

  tags = {
    Name = "my-Private-RT"
  }
}
