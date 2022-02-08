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

data "aws_route_table" "web_route_table" {

  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id
  subnet_id = data.terraform_remote_state.vpc.outputs.web_subnet_ids[0]

  #subnet_id = "${var.subnet_id}"
}

data "aws_route_table" "app_route_table" {

  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id
  subnet_id = data.terraform_remote_state.vpc.outputs.app_subnet_ids[0]


}

data "aws_route_table" "dbs_route_table" {

  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id
  subnet_id = data.terraform_remote_state.vpc.outputs.dbs_subnet_ids[0]

}

###############################################################################
# UPSA routes for all subnet route tables
###############################################################################
module "create_routes_web" {
  source = "../../../../../../modules/transit-gateway/vpc-routes"

  route_table_id           = data.aws_route_table.web_route_table.route_table_id
  destination_cidr_block    = var.destination_cidr_block_ntw
  transit_gateway_id        = var.transit_gateway_id
  create_internet_route     = var.create_internet_route

}

module "create_routes_app" {
  source = "../../../../../../modules/transit-gateway/vpc-routes"

  route_table_id           = data.aws_route_table.app_route_table.route_table_id
  destination_cidr_block    = var.destination_cidr_block_ntw
  transit_gateway_id        = var.transit_gateway_id
  create_internet_route     = var.create_internet_route

}


module "create_routes_dbs" {
  source = "../../../../../../modules/transit-gateway/vpc-routes"

  route_table_id           = data.aws_route_table.dbs_route_table.route_table_id
  destination_cidr_block    = var.destination_cidr_block_ntw
  transit_gateway_id        = var.transit_gateway_id
  create_internet_route     = var.create_internet_route

}
