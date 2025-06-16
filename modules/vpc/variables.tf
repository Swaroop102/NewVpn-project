# variables.tf
variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "cidr_block" {
  type = string
}

variable "instance_tenancy" {
  type = string
  default = "default"
}

variable "tags_name" {
  type = string
}

variable "name_prefix" {
  description = "Prefix to use for resource names"
  type        = string
}