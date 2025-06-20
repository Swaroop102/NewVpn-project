# variables.tf
variable "ami" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "security_group_id" {
  type = string
}

variable "tags_name" {
  type = string
}

variable "name_prefix" {
  type        = string
  description = "Name prefix for EC2 instances"
}

variable "instance_count" {
  type        = number
  default     = 1
  description = "Number of EC2 instances to launch"
}

variable "associate_public_ip" {
  type    = bool
  default = false
}