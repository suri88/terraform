data aws_availability_zones all {}

resource aws_subnet this {
  
  count                       = var.private_subnets

  vpc_id                      = var.vpc_id

  cidr_block                  = cidrsubnet(var.vpc_cidr_block, 
                                          var.private_newbit_size, 
                                          count.index + var.private_subnet_start)
  
  availability_zone           = element(data.aws_availability_zones.all.names, count.index)

  map_public_ip_on_launch     = false

  tags = merge(
    {
      "Name" = "${var.vpc_name}-${var.private_subnet_name}-${"private-az"}-${count.index +1}",
      "Role" = var.private_subnet_role
    },
    var.upsa_account_tags,
  )
}

resource aws_route_table this {
  vpc_id = var.vpc_id

  tags = merge(
    {
      "Name" = "${var.vpc_name}-${var.private_subnet_name}-${"private-rtb"}",
      "Role" = var.private_route_table_role
    },
    var.upsa_account_tags,
  )
}

resource aws_route_table_association this {
  
  count                       = length(data.aws_availability_zones.all.names)

  subnet_id                   = element(aws_subnet.this.*.id, count.index)
  
  route_table_id              = aws_route_table.this.id

}

resource aws_network_acl this {
  
  vpc_id                      = var.vpc_id
  
  subnet_ids                  = aws_subnet.this.*.id 

/* This needs to be changed to a resource type to allow for 
    future ports to be added and tested in different 
    environment!...*/
  ingress {    /* Rule # 100*/
    protocol   = -1
    rule_no    = 100
    action     = "allow"
    cidr_block = var.destination_cidr_block
    from_port  = 0
    to_port    = 0
  }  

  egress {     /* Rule 100 */
    protocol   = -1
    rule_no    = 100
    action     = "allow"
    cidr_block = var.destination_cidr_block
    from_port  = 0
    to_port    = 0
  }

  tags = merge(
    {
      "Name" = "${var.vpc_name}-${var.private_subnet_name}-${var.private_network_acl_name}",
      "Role" = var.private_network_acl_role
    },
    var.upsa_account_tags,
  )
}