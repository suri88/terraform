variable "transit_gateway_vpc_attachment_id" {
  description = "Identifier of EC2 Transit Gateway attachment id"
  type        = string
  default     = null
}

variable "transit_gateway_default_route_table_association" {
  description = "transit gateway default route table association"
  type        = bool
  default     = false
}

variable "transit_gateway_default_route_table_propagation" {
  description = "transit gateway default route table propagation"
  type        = bool
  default     = false
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}