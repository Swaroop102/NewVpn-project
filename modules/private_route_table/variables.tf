variable "vpc_id" {}
variable "private_subnet_ids" {
  type = list(string)
}
variable "nat_gateway_id" {}
variable "name_prefix" {}
