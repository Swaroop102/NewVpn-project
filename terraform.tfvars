vpc_cidr_block           = "10.0.0.0/16"
vpc_instance_tenancy     = "default"
vpc_tags_name            = "my-vpc"
name_prefix          = "myapp"

availability_zones   = ["ap-south-1a", "ap-south-1b"]

public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs = ["10.0.101.0/24", "10.0.102.0/24"]


igw_tags_name            = "my-igw"
route_table_tags_name    = "my-route-table"

sg_name                  = "web-sg"
sg_description           = "Allow web traffic"
sg_tags_name             = "web-sg"
sg_ingress_rules = [
  {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  },
  {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
]
sg_egress_from_port      = 0
sg_egress_to_port        = 0
sg_egress_protocol       = "-1"
sg_egress_cidr_block     = ["0.0.0.0/0"]

ec2_ami                  = "ami-0e35ddab05955cf57"
ec2_instance_type        = "t2.micro"
ec2_tags_name            = "web-instance"
