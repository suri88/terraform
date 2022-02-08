###############################################################################
# AWS Provider!..
###############################################################################

provider "aws" {


    region  = var.region
    version = "~> 2.60"

}


###############################################################################
# UPSA routes for all subnet route tables
###############################################################################
module "create_routes_egress_ntw" {
  source = "../../../../../modules/transit-gateway/vpc-routes"

  route_table_id           = var.route_table_id_egress
  destination_cidr_block    = var.destination_cidr_block_vpc
  transit_gateway_id        = var.transit_gateway_id
  create_internet_route     = var.create_internet_route_egress

}
