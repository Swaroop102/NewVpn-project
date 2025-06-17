output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_ids" {
  value = module.subnets.public_subnet_ids
}


output "igw_id" {
  value = module.igw.igw_id
}

output "private_route_table_id" {
  value = module.private_route_table.private_route_table_id
}

output "security_group_id" {
  value = module.security_group.security_group_id
}

output "ec2_instance_id" {
  value = module.ec2_instance.ec2_instance_id
}
output "ec2_public_ips" {
  value = module.ec2_instance.public_ips
}


output "nat_gateway_id" {
  value = module.nat_gateway.nat_gateway_id
}
