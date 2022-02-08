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
module "tgw-vpc-accept-attachment" {
  source = "../../../../../modules/transit-gateway/vpc-attachments-accept"

    transit_gateway_vpc_attachment_id = data.aws_ec2_transit_gateway_vpc_attachment.vpc_attachment.id
    #transit_gateway_route_table_id = var.transit_gateway_route_table_id
    transit_gateway_default_route_table_association = var.transit_gateway_default_route_table_association
    transit_gateway_default_route_table_propagation = var.transit_gateway_default_route_table_propagation
    tags = merge(var.upsa_account_tags, map(
    "Name", format ("%s",var.tgw_attachment_name)
    )
  )

    

}


