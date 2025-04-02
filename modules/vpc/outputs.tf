output "vpc_id" {
  value = aws_vpc.this.id
}

output "nat_gateway_id" {
  value = aws_nat_gateway.this.id
}

output "gateway_id" {
  value = aws_internet_gateway.this
}

output "public_1_id" {
  value = aws_subnet.public_1.id
}

output "public_2_id" {
  value = aws_subnet.public_2.id
}

output "private_1_id" {
  value = aws_subnet.public_1.id
}

output "private_2_id" {
  value = aws_subnet.public_2.id
}