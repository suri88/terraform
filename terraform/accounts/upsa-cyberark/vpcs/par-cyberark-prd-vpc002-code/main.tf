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

  manage_default_vpc                  = true
  default_vpc_name                    = "do not use!.."

  region                              = var.region
  vpc_name                            = var.vpc_name
  vpc_role                            = var.vpc_role
  vpc_cidr_block                      = var.vpc_cidr_block

  vpc_tags = merge(module.upsa-tags.upsa_aws_cyberark_prd_env_default_tags, map(
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
# Database  Subnets
###############################################################################

module dbs-subnets {
  source = "../../../../modules/dbs-subnets"

  region                              = module.vpc.region
  vpc_name                            = module.vpc.vpc_name
  vpc_id                              = module.vpc.id
  vpc_cidr_block                      = module.vpc.vpc_cidr_block
  destination_cidr_block              = var.destination_cidr_block
  dbs_subnet_name                     = var.dbs_subnet_name
  dbs_subnet_role                     = var.dbs_subnet_role
  dbs_subnets                         = var.dbs_subnets
  dbs_newbit_size                     = var.dbs_newbit_size
  dbs_subnet_start                    = var.dbs_subnet_start
  dbs_route_table_role                = var.dbs_route_table_role
  dbs_network_acl_name                = var.dbs_network_acl_name
  dbs_network_acl_role                = var.dbs_network_acl_role

  upsa_account_tags                   = module.upsa-tags.upsa_aws_cyberark_prd_env_default_tags
}

###############################################################################
# UPSA-Network Security Group
###############################################################################

module security-groups {
  source = "../../../../modules/security-groups"

  vpc_id                              = module.vpc.id
  destination_cidr_block              = var.destination_cidr_block
  security_group_cidr_block           = var.security_group_cidr_block
  security_group_description          = var.security_group_description
  ingress_ports                       = var.ingress_ports
  dynamic_ingress_description         = var.dynamic_ingress_description
  security_group_name                 = var.security_group_name
  security_group_role                 = var.security_group_role

  upsa_account_tags                   = module.upsa-tags.upsa_aws_cyberark_prd_env_default_tags
}

###############################################################################
# UPSA Global Tagging Module
###############################################################################

module upsa-tags {
  source = "../../../../modules/upsa-tags"

}
