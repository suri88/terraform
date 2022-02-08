variable "transit_gateway_id" {
  description = "tgw id"
  type        = string
  default     = null
}

variable "destination_cidr_block" {
  description = "destination cidr"
  type        = string
  default     = null
}

variable "route_table_id" {
  description = "route table id to add route"
  type        = string
  default     = null
}

variable "create_internet_route" {
  description = "check for internet route creation"
  type        = bool
  default     = "false"
}
variable "destination_cidr_block_internet" {
  description = "destination cidr for internet"
  type        = string
  default     = "0.0.0.0/0"
}
