provider "aws" {
  region = var.region
}

##################################################################
# Data sources to get VPC, subnet, security group details
##################################################################
data "aws_vpc" "example" {
  id = var.vpc_id
}

/*data "aws_subnet_ids" "all" {
  vpc_id = data.aws_vpc.example.id

  tags = {
    Role = var.subnet_role
  }
} */

module upsa-tags {
  source = "../../../../modules/upsa-tags"
}

##################################################################
# EC2 Instance and AMI details
##################################################################

module "ec2" {
  source = "../../../../modules/ec2"
  instance_count              = var.instance_count
  aws_instance_name           = var.aws_instance_name
  instance_role               = var.instance_role
  ami                         = var.ami
  instance_type               = var.instance_type
  private_ip                  = var.private_ip
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = var.security_group_ids
  associate_public_ip_address = var.associate_public_ip_address
  get_password_data           = var.get_password_data
  root_block_device           = var.root_block_device
  ebs_block_device            = var.ebs_block_device
  upsa_account_tags           = module.upsa-tags.upsa_aws_cicd_dev_env_default_tags

}
