variable "vpc_cidr_block" {}
variable "vpc_instance_tenancy" {}
variable "vpc_tags_name" {}

variable "vpc_id" {
  description = "The ID of the VPC where subnets will be created"
  type        = string
}

variable "name_prefix" {}
variable "igw_tags_name" {}
variable "route_table_tags_name" {}

variable "sg_name" {}
variable "sg_description" {}
variable "sg_tags_name" {}
variable "sg_ingress_rules" {
  type = list(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}
variable "sg_egress_from_port" {}
variable "sg_egress_to_port" {}
variable "sg_egress_protocol" {}
variable "sg_egress_cidr_block" {
  type = list(string)
}

variable "ec2_ami" {}
variable "ec2_instance_type" {}
variable "ec2_tags_name" {}

variable "public_subnet_id" {
  type        = string
  description = "ID of public subnet"
}


