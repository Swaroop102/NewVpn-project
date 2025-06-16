# variables.tf
variable "vpc_id" {
  type = string
}

variable "availability_zones" {
 type = list(string)
}

variable "name_prefix" {
  type        = string
  description = "Prefix for subnet names"
}
# variable "map_public_ip_on_launch" {
#   type    = bool
#   default = false
# }

variable "private_subnet_cidrs" {
  type = list(string)
}
variable "public_subnet_cidrs" {
  type = list(string)
}