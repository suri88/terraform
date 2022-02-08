variable "ram_resource_name" {
  description = "Name of RAM resource share"
  type        = string
  default     = null
}

variable "transit_gateway_arn" {
  description = "Transit gateway arn"
  type        = string
  default     = null
}

variable "account_number" {
  description = "AWS principal account number"
  type        = string
  default     = null
}

// Tags
variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}
