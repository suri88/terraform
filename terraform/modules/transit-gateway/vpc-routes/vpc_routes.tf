resource "aws_route" "route_to_tgw" {
  route_table_id            = var.route_table_id
  destination_cidr_block    = var.destination_cidr_block
  transit_gateway_id = var.transit_gateway_id

  timeouts {
    create = "4m"   
  }
}

resource "aws_route" "route_to_internet" {
  count = var.create_internet_route ? 1 : 0
  route_table_id            = var.route_table_id
  destination_cidr_block    = var.destination_cidr_block_internet
  transit_gateway_id = var.transit_gateway_id

  timeouts {
    create = "4m"   
  }
}
