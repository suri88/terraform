###############################################################################
# AWS Provider!..
###############################################################################

provider "aws" {


    region  = var.region
    version = "~> 2.60"

}

data "terraform_remote_state" "vpc" {
    backend = "s3"
    config = {
        bucket  = var.s3_bucket
        key     = var.s3_vpc_key
        region  = var.region
    }
}

###############################################################################
# UPSA Trasit gateway attachements
###############################################################################
module "attach_to_tgw" {
  source = "../../../../../../modules/transit-gateway/vpc-attachments"

  vpc_attachments = {
    vpc1 = {
      vpc_id                                          = data.terraform_remote_state.vpc.outputs.vpc_id
      subnet_ids                                      = data.terraform_remote_state.vpc.outputs.app_subnet_ids
      dns_support                                     = true
      #ipv6_support                                    = true
      transit_gateway_default_route_table_association = var.transit_gateway_default_route_table_association
      transit_gateway_default_route_table_propagation = var.transit_gateway_default_route_table_propagation
      transit_gateway_id = var.transit_gateway_id

    },
 }
  tags = merge(var.upsa_account_tags, map(
    "Name", format ("%s",var.tgw_attachment_name)    
    )
  )
    
}

