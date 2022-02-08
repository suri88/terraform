locals {
  vpc_attachments_without_default_route_table_association = {
    for k, v in var.vpc_attachments : k => v if lookup(v, "transit_gateway_default_route_table_association", true) != true
  }

  // List of maps with key and route values
  vpc_attachments_with_routes = chunklist(flatten([
    for k, v in var.vpc_attachments : setproduct([map("key", k)], v["tgw_routes"]) if length(lookup(v, "tgw_routes", {})) > 0
  ]), 2)


}

/*resource "aws_ec2_transit_gateway_vpc_attachment_accepter" "vpc_attachment_accept" {
  transit_gateway_attachment_id = var.transit_gateway_vpc_attachment_id
  transit_gateway_default_route_table_association = var.transit_gateway_default_route_table_association
  transit_gateway_default_route_table_propagation = var.transit_gateway_default_route_table_propagation

  tags = var.tags
} */
// VPC attachment routes
resource "aws_ec2_transit_gateway_route" "this" {
  #depends_on = [aws_ec2_transit_gateway_vpc_attachment_accepter.vpc_attachment_accept]
  count = length(local.vpc_attachments_with_routes)

  destination_cidr_block = local.vpc_attachments_with_routes[count.index][1]["destination_cidr_block"]
  blackhole              = lookup(local.vpc_attachments_with_routes[count.index][1], "blackhole", null)

  transit_gateway_route_table_id = var.transit_gateway_route_table_id
  transit_gateway_attachment_id  = var.transit_gateway_vpc_attachment_id
}



resource "aws_ec2_transit_gateway_route_table_association" "this" {
  #depends_on = [aws_ec2_transit_gateway_vpc_attachment_accepter.vpc_attachment_accept]
  for_each = local.vpc_attachments_without_default_route_table_association

  // Create association if it was not set already by aws_ec2_transit_gateway_vpc_attachment resource
  transit_gateway_attachment_id  = var.transit_gateway_vpc_attachment_id
  transit_gateway_route_table_id = var.transit_gateway_route_table_id
}
/*
resource "aws_ec2_transit_gateway_route_table_propagation" "this" {
  for_each = local.vpc_attachments_without_default_route_table_association

  // Create association if it was not set already by aws_ec2_transit_gateway_vpc_attachment resource
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.this[each.key].id
  transit_gateway_route_table_id = var.transit_gateway_route_table_id
} */
