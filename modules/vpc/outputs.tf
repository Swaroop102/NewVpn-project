# outputs.tf
output "vpc_id" {
  value = aws_vpc.main.id
}
output "private_route_table_id" {
  value = aws_route_table.private.id
}

output "igw_id" {
  value = aws_internet_gateway.this.id
}