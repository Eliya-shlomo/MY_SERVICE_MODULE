// modules/routable/main.tf

resource "aws_route_table" "my_Public_RT" {
  vpc_id = var.vpc_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.nat_gateway_id
  }
  tags = {
    Name = "my-Private-RT"
  }
}


resource "aws_route_table" "my_Private_RT" {
  vpc_id = var.vpc_id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = var.nat_gateway_id
  }

  tags = {
    Name = "my-Private-RT"
  }
}
