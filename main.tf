module "vpc" {
  source           = "./modules/vpc"
  vpc_id  = var.vpc_id
  cidr_block       = var.vpc_cidr_block
  instance_tenancy = var.vpc_instance_tenancy
  tags_name        = var.vpc_tags_name
}

module "subnets" {
  source            = "./modules/subnets"
  vpc_id            = module.vpc.vpc_id
  subnet_cidrs      = ["10.0.1.0/24", "10.0.2.0/24"]
  availability_zones = ["ap-south-1a", "ap-south-1b"]
  name_prefix       = "myapp"
}

module "igw" {
  source    = "./modules/internet_gateway"
  vpc_id    = module.vpc.vpc_id
  tags_name = var.igw_tags_name
}

module "route_table" {
  source     = "./modules/route_table"
  vpc_id     = module.vpc.vpc_id
  gateway_id = module.igw.igw_id
  tags_name  = var.route_table_tags_name
}


module "route_table_association" {
  source         = "./modules/route_table_association"
  count          = length(module.subnets.public_subnet_ids)
  subnet_id      = module.subnets.public_subnet_ids[count.index]
  route_table_id = module.vpc.private_route_table_id

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
  subnet_id = module.subnets.public_subnet_ids[0]
  security_group_id = module.security_group.security_group_id
  tags_name        = var.ec2_tags_name
  name_prefix    = "web" 
  instance_count = 2
}

provider "aws" {
  region = "ap-south-1"  # Change to your preferred region
}

module "nat_gateway" {
  source           = "./modules/nat_gateway"
  public_subnet_id  = module.subnets.public_subnet_ids[0]
}
