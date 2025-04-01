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







