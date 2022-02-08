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
    bucket = var.s3_bucket
    key    = var.s3_vpc_key
    region = var.region
  }
}

data "aws_ec2_transit_gateway_vpc_attachment" "vpc_attachment" {
  filter {
    name   = "vpc-id"
    values = [data.terraform_remote_state.vpc.outputs.vpc_id]
  }
}





###############################################################################
# UPSA Trasit gateway attachements
###############################################################################
module "tgw-routes" {
  source = "../../../../../modules/transit-gateway/tgw-routes"

  vpc_attachments = {
    vpc1 = {
      vpc_id                                          = data.terraform_remote_state.vpc.outputs.vpc_id
      subnet_ids                                      = data.terraform_remote_state.vpc.outputs.app_subnet_ids
      dns_support                                     = true
      #ipv6_support                                    = true
      transit_gateway_default_route_table_association = false
      transit_gateway_default_route_table_propagation = false
      #transit_gateway_id = var.transit_gateway_id

      tgw_routes = [
        {
          destination_cidr_block = var.vpc_cidr_block
        }]

    },

  }
    transit_gateway_vpc_attachment_id = data.aws_ec2_transit_gateway_vpc_attachment.vpc_attachment.id
    transit_gateway_route_table_id = var.transit_gateway_route_table_id
    transit_gateway_default_route_table_association = var.transit_gateway_default_route_table_association
    transit_gateway_default_route_table_propagation = var.transit_gateway_default_route_table_propagation
    tags = var.upsa_account_tags

}


