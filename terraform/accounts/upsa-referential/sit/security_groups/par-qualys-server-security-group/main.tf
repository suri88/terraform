###############################################################################
# AWS Provider!..
###############################################################################

provider "aws" {

    region  = var.region
    version = "~> 2.60"

}



################################################
# Security group with complete set of arguments
################################################
module "security_groups" {
  source = "../../../../../modules/security-groups-sg"

  security_group_name        = var.security_group_name
  security_group_description = var.security_group_description
  security_group_role        = var.security_group_role
  vpc_id      = var.vpc_id
  upsa_account_tags = var.upsa_account_tags


  # Default CIDR blocks, which will be used for all ingress rules in this module.
  ingress_cidr_blocks = var.ingress_cidr_blocks
  ingress_rules = var.ingress_rules

  # Open to CIDRs blocks (rule or from_port+to_port+protocol+description)
  ingress_with_cidr_blocks = var.ingress_with_cidr_blocks

  # Open for security group id (rule or from_port+to_port+protocol+description)
  ingress_with_source_security_group_id = var.ingress_with_source_security_group_id


 # Open for self (rule or from_port+to_port+protocol+description)
  ingress_with_self = var.ingress_with_self


  # Default CIDR blocks, which will be used for all egress rules in this module.
  egress_cidr_blocks = var.egress_cidr_blocks
  egress_rules = var.egress_rules
  # Open to CIDRs blocks (rule or from_port+to_port+protocol+description)
  egress_with_cidr_blocks = var.egress_with_cidr_blocks


  # Open for security group id (rule or from_port+to_port+protocol+description)
  egress_with_source_security_group_id = var.egress_with_source_security_group_id

  # Open for self (rule or from_port+to_port+protocol+description)
  egress_with_self = var.egress_with_self

}
