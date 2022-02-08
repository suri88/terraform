###############################################################################
# Expected values from the caller
###############################################################################
variable "create_vpc" {
  description = "Controls if VPC should be created (it affects almost all resources)"
  type        = bool
  default     = false
}
variable region {}
variable vpc_cidr_block {}
variable vpc_name {}
variable vpc_role {}
variable "default_vpc_name" {
  type = "string"
  description = "describe your variable"
  default = "do not use!.."
}



variable destination_cidr_block {}
variable destination_cidr_block_ntw {}
variable destination_cidr_block_vpc {}
variable app_subnets {}


variable app_subnet_name {}
variable app_subnet_role {}
variable app_newbit_size {}
variable app_subnet_start {}
variable app_route_table_role {}
variable app_network_acl_name {}
variable app_network_acl_role {}

variable web_subnets {}
variable web_subnet_name {}
variable web_subnet_role {}
variable web_newbit_size {}
variable web_subnet_start {}
variable web_route_table_role {}
variable web_network_acl_name {}
variable web_network_acl_role {}

variable dbs_subnets {}
variable dbs_subnet_name {}
variable dbs_subnet_role {}
variable dbs_newbit_size {}
variable dbs_subnet_start {}
variable dbs_route_table_role {}
variable dbs_network_acl_name {}
variable dbs_network_acl_role {}

variable security_group_name {}
variable security_group_description {}
variable security_group_cidr_block {}
variable dynamic_ingress_description {}
variable ingress_ports {}
variable security_group_role {}


variable transit_gateway_id {}


variable "create_internet_route" {
  description = "check for create internet route"
  type        = bool
  default     = false
}


variable "s3_bucket" {
  description = "s3 bucket name"
  type        = string
  default     = null
}

variable "s3_vpc_key" {
  description = "s3 bucket vpc key"
  type        = string
  default     = null
}

variable "transit_gateway_route_table_id" {
  description = "Identifier of EC2 Transit Gateway Route Table to use with the Target Gateway when reusing it between multiple TGWs"
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


variable "route_table_id" {
  description = "route table id of egress subnet of ntw"
  type        = string
  default     = null
}

variable "route_table_id_egress" {
  description = "route table id of egress subnet of ntw"
  type        = string
  default     = null
}

variable "create_internet_route_egress" {
  description = "check for create internet route"
  type        = bool
  default     = false
}

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

variable "tgw_attachment_name" {
  description = "TGW attachment Name"
  type        = string
  default     = null
}

variable upsa_account_tags {
  type        = map(string)
  description = "Default tags to be applied to all resources created in Shared Services"
  default = {}    
}




