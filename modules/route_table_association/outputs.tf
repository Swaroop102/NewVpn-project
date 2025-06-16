
output "associated_subnet_id" {
  description = "The ID of the subnet associated with the route table"
  value       = aws_route_table_association.this.subnet_id
}

output "associated_route_table_id" {
  description = "The ID of the route table associated with the subnet"
  value       = aws_route_table_association.this.route_table_id
}