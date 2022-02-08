###############################################################################
# AWS Provider!..
###############################################################################

provider "aws" {

    region  = var.region
    version = "~> 2.60"

}


###############################################################################
# UPSA Trasit gateway attachements
###############################################################################
module "ram" {
  source = "../../../../../modules/transit-gateway/ram"

  ram_resource_name = var.ram_resource_name
  transit_gateway_arn = var.transit_gateway_arn
  account_number = var.account_number
  tags = merge(var.upsa_account_tags, map(
    "Name", format ("%s",var.ram_resource_name)    
    )
  )

}


