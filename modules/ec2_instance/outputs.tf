# outputs.tf
output "ec2_instance_id" {
  value = aws_instance.this[*].id
}
output "public_ips" {
  value = aws_instance.this[*].public_ip
}
