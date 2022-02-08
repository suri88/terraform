###############################################################################
# AWS Provider!..
###############################################################################

# provider "aws" {
    
    
#     region  = var.region
#     version = "~> 2.60"
    
# }

###############################################################################
# Base Network
###############################################################################

module vpc {
  source = "../../../../modules/vpc"
  create_vpc                          = true

  region                              = var.region
  vpc_name                            = var.vpc_name
  vpc_role                            = var.vpc_role
  vpc_cidr_block                      = var.vpc_cidr_block

  vpc_tags = merge(module.upsa-tags.upsa_aws_cicd_dev_env_default_tags, map(
    "Name", format ("%s",var.vpc_name),
    "Role", var.vpc_role
    )
  ) 

  default_vpc_tags = merge(module.upsa-tags.upsa_aws_default_vpc_tags, map(
    "Name", format ("%s",var.default_vpc_name)
    )
  )
}
###############################################################################
# UPSA Global Tagging Module
###############################################################################
module upsa-tags {
  source = "../../../../modules/upsa-tags"

}
###############################################################################
# Jenkins Application  Subnets
###############################################################################

module app-subnets {
  source = "../../../../modules/app-subnets"

  region                              = module.vpc.region
  vpc_name                            = module.vpc.vpc_name
  vpc_id                              = module.vpc.id
  vpc_cidr_block                      = module.vpc.vpc_cidr_block
  destination_cidr_block              = var.destination_cidr_block  
  app_subnet_name                     = var.app_subnet_name
  app_subnet_role                     = var.app_subnet_role
  app_subnets                         = var.app_subnets
  app_newbit_size                     = var.app_newbit_size
  app_subnet_start                    = var.app_subnet_start
  app_route_table_role                = var.app_route_table_role
  app_network_acl_name                = var.app_network_acl_name
  app_network_acl_role                = var.app_network_acl_role

  upsa_account_tags                   = module.upsa-tags.upsa_aws_cicd_dev_env_default_tags  
}
###############################################################################
# Default Security  Group - UPSA-Network
###############################################################################
module security-groups {
  source = "../../../../modules/security-groups"

  vpc_id                              = module.vpc.id
  destination_cidr_block              = module.app-subnets.destination_cidr_block
  security_group_cidr_block           = var.security_group_cidr_block
  security_group_description          = var.security_group_description
  ingress_ports                       = var.ingress_ports
  dynamic_ingress_description         = var.dynamic_ingress_description
  security_group_name                 = var.security_group_name
  security_group_role                 = var.security_group_role

  upsa_account_tags                   = module.upsa-tags.upsa_aws_cicd_dev_env_default_tags
}
