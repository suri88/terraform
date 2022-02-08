provider "aws" {
  region = var.region
}

##################################################################
# Data sources to get VPC, subnet, security group details
##################################################################
data "aws_vpc" "example" {
  id = var.vpc_id
}

data "aws_subnet_ids" "all" {
  vpc_id = data.aws_vpc.example.id
}

module upsa-tags {
  source = "../../../../modules/upsa-tags"
}
module "security-groups" {
  source = "../../../../modules/security-groups"
  vpc_id                      = data.aws_vpc.example.id
  security_group_name         = var.security_group_name
  ingress_ports               = var.ingress_ports
  security_group_description = var.security_group_description
  security_group_cidr_block   = var.security_group_cidr_block
  dynamic_ingress_description = var.dynamic_ingress_description
  destination_cidr_block     = var.destination_cidr_block
  security_group_role         =var.security_group_role
  upsa_account_tags           = module.upsa-tags.upsa_aws_cicd_dev_env_default_tags
}

##################################################################
# EC2 Instance and AMI details
##################################################################

module "ec2" {
  source = "../../../../modules/ec2"
  instance_count          = 1
  aws_instance_name       = var.aws_instance_name
  instance_role           = var.instance_role
  ami                     = var.ami
  instance_type           = var.instance_type
  key_name                = var.key_name
  private_ip              = var.private_ip
  subnet_id               = tolist(data.aws_subnet_ids.all.ids)[var.subnet_num]
  vpc_security_group_ids      = [module.security-groups.id]
  associate_public_ip_address = false
  get_password_data     =   "true"
  
  root_block_device = var.root_block_device

  ebs_block_device = var.ebs_block_device

  upsa_account_tags           = module.upsa-tags.upsa_aws_cicd_dev_env_default_tags

}
