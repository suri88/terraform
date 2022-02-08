output database_cidrs {
  value = aws_subnet.this.*.cidr_block
}

output destination_cidr_block {
  value = var.destination_cidr_block
}

output ids {
  value = aws_subnet.this.*.id
}
