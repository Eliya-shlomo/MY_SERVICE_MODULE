output "route_table_public_id" {
  value = aws_route_table.my_Public_RT.id
}

output "route_table_private_id" {
  value = aws_route_table.my_Private_RT.id
}