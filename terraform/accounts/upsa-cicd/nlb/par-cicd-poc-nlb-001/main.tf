provider "aws" {
  region = "eu-west-3"
}

##################################################################
# Data sources to get VPC and subnets
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

module "nlb" {
  source = "../../../../modules/nlb"

  aws_lb_role                = var.aws_lb_role
  aws_lb_name                = var.aws_lb_name
  load_balancer_type         = var.load_balancer_type
  vpc_id                     = data.aws_vpc.example.id
  internal                   = var.internal
  subnets                    = var.subnets
  subnet_mapping             = var.subnet_mapping
  enable_deletion_protection = var.enable_deletion_protection
  enable_cross_zone_load_balancing = var.enable_cross_zone_load_balancing
  target_groups              = var.target_groups
  https_listeners            = var.https_listeners 
  http_tcp_listeners         = var.http_tcp_listeners 
  target_ids                 = var.target_ids
  target_port                 =var.target_port
  upsa_account_tags           = module.upsa-tags.upsa_aws_cicd_dev_env_default_tags
}