## initialize of eip for each Nat-gw
resource "aws_eip" "my_NAT_IP" {
  domain = "vpc"
}


## initialize of NAT-gateway
resource "aws_nat_gateway" "my-nat-gw" {
  allocation_id = aws_eip.my_NAT_IP.id
  subnet_id = aws_subnet.my_public_subnet-1.id
  depends_on = [aws_internet_gateway.my_gw]
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



resource "aws_route_table_association" "my-private-1-a" {
  subnet_id = aws_subnet.my_private_subnet-1.id
  route_table_id = aws_route_table.my_Private_RT.id
}

resource "aws_route_table_association" "my-private-2-b" {
  subnet_id = aws_subnet.my_private_subnet-2.id
  route_table_id = aws_route_table.my_Private_RT.id
}

resource "aws_route_table_association" "my-private-3-c" {
  subnet_id = aws_subnet.my_private_subnet-3.id
  route_table_id = aws_route_table.my_Private_RT.id
}
