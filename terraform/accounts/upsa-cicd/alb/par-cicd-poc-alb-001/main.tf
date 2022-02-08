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
# module "security-groups" {
#   source = "../../../../modules/security-groups"
#   vpc_id                      = data.aws_vpc.example.id
#   security_group_name         = var.security_group_name
#   ingress_ports               = var.ingress_ports
#   security_group_description  = var.security_group_description
#   security_group_cidr_block   = var.security_group_cidr_block
#   dynamic_ingress_description = var.dynamic_ingress_description
#   destination_cidr_block      = var.destination_cidr_block
#   security_group_role         = var.security_group_role
#   upsa_account_tags           = module.upsa-tags.upsa_aws_cicd_dev_env_default_tags
# }


##################################################################
# Application Load Balancer
##################################################################
module "alb" {
  source = "../../../../modules/alb"
  aws_lb_role                   = var.aws_lb_role
  aws_lb_name                   = var.aws_lb_name 
  internal                      = var.internal
  subnets                       = var.subnets  
  security_groups               = var.security_groups
  #security_groups              = [module.security-groups.id]           
  load_balancer_type            = var.load_balancer_type
  vpc_id                        = data.aws_vpc.example.id
  enable_deletion_protection    = var.enable_deletion_protection
  enable_cross_zone_load_balancing = var.enable_cross_zone_load_balancing
  target_groups                 = var.target_groups
  http_tcp_listeners            = var.http_tcp_listeners
  https_listeners               = var.https_listeners
  target_ids                    = var.target_ids
  target_port                   = var.target_port
  upsa_account_tags             = module.upsa-tags.upsa_aws_cicd_dev_env_default_tags
 
}