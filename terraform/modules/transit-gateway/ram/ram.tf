resource "aws_ram_resource_share" "ram_tgw" {

  name = var.ram_resource_name
  tags = var.tags
}

// Share the transit gateway...
resource "aws_ram_resource_association" "ram_tgw_association" {

  resource_arn       = var.transit_gateway_arn
  resource_share_arn = aws_ram_resource_share.ram_tgw.id
}

// ...with the second account.
resource "aws_ram_principal_association" "ram_principal_association" {

  principal          = var.account_number
  resource_share_arn = aws_ram_resource_share.ram_tgw.id
}
