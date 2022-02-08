// VPC attachments
variable "vpc_attachments" {
  description = "Maps of maps of VPC details to attach to TGW. Type 'any' to disable type validation by Terraform."
  type        = any
  default     = {}
}

variable "transit_gateway_route_table_id" {
  description = "Identifier of EC2 Transit Gateway Route Table to use with the Target Gateway when reusing it between multiple TGWs"
  type        = string
  default     = null
}

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

// Tags
variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}
