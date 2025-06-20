module "vpc" {
  source           = "./modules/vpc"
  vpc_id  = var.vpc_id
 # public_subnet_id  = aws_subnet.public.id
   name_prefix = "myproject"
  cidr_block       = var.vpc_cidr_block
  instance_tenancy = var.vpc_instance_tenancy
  tags_name        = var.vpc_tags_name
}

module "subnets" {
  source            = "./modules/subnets"
  vpc_id            = module.vpc.vpc_id
  public_subnet_cidrs      = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidrs = ["10.0.101.0/24", "10.0.102.0/24"]
  availability_zones = ["ap-south-1a", "ap-south-1b"]
  name_prefix       = "myapp"
}

module "igw" {
  source    = "./modules/internet_gateway"
  vpc_id    = module.vpc.vpc_id
  tags_name = var.igw_tags_name
}

module "networking" {
  source = "./modules/networking"
  vpc_id = module.vpc.vpc_id
 public_subnet_ids  = module.subnets.public_subnet_ids
}


module "private_route_table" {
  source             = "./modules/private_route_table"
  vpc_id             = module.vpc.vpc_id
  private_subnet_ids = module.subnets.private_subnet_ids
  nat_gateway_id     = module.nat_gateway.nat_gateway_id
  name_prefix        = var.name_prefix
}

module "route_table_association" {
  source         = "./modules/route_table_association"
  count          = length(module.subnets.public_subnet_ids)
  subnet_id      = module.subnets.public_subnet_ids[count.index]
  route_table_id = module.private_route_table.private_route_table_id

}


module "security_group" {
  source            = "./modules/security_group"
  name              = var.sg_name
  description       = var.sg_description
  vpc_id            = module.vpc.vpc_id
  ingress_rules     = var.sg_ingress_rules
  tags_name         = var.sg_tags_name

  
}


module "ec2_instance" {
  source           = "./modules/ec2_instance"
  ami              = var.ec2_ami
  instance_type    = var.ec2_instance_type
  #key_name             = var.key_name
  subnet_id = module.subnets.public_subnet_ids[0]
  security_group_id = module.security_group.security_group_id
  tags_name        = var.ec2_tags_name
  name_prefix    = "public" 
  instance_count = 1
  associate_public_ip  = true
}

module "ec2_instance1" {
  source               = "./modules/ec2_instance"
  ami                  = var.ec2_ami
  instance_type        = var.ec2_instance_type
  #key_name             = var.key_name
  subnet_id            = module.subnets.private_subnet_ids[0]
  security_group_id    = module.security_group.security_group_id
  associate_public_ip  = false
   tags_name        = var.ec2_tags_name
  name_prefix          = "private"
  instance_count       = 1
}
provider "aws" {
  region = "ap-south-1"  # Change to your preferred region
}

module "nat_gateway" {
  source           = "./modules/nat_gateway"
  public_subnet_id  = module.subnets.public_subnet_ids[0]
  name_prefix      = var.name_prefix
}
