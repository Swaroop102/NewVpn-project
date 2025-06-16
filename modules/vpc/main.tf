# main.tf
resource "aws_vpc" "main" {
  cidr_block       = var.cidr_block
  instance_tenancy = var.instance_tenancy
  tags = {
    Name = var.tags_name
  }
  
}
resource "aws_route_table" "private" {
  vpc_id = var.vpc_id
  # ...
}
resource "aws_internet_gateway" "this" {
  vpc_id = var.vpc_id

  tags = {
    Name = "${var.name_prefix}-igw"
  }
}
