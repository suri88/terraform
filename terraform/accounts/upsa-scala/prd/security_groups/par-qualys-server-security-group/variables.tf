variable "region" {
  description = "Region name for this security group"
  type        = string
}

#################################################
# Security Group
#################################################

variable security_group_name {
  description = "Name of security group"
  type        = string
}
variable security_group_description {
  description = "Description of security group"
  type        = string
}

variable security_group_role {
  description = "Role of security group"
  type        = string
}

#################################################
# Variables exported for Downstream Consumption
#################################################

variable "vpc_id" {
  description = "ID of the VPC where to create security group"
  type        = string
}


#################################################
# UPSA Global Account Tags
#################################################

variable upsa_account_tags {}

variable "create" {
  description = "Whether to create security group and all rules"
  type        = bool
  default     = true
}

variable "ingress_with_source_security_group_id" {
  description = "List of ingress rules to create where 'source_security_group_id' is used"
  type        = list(map(string))
  default     = []
}

variable "ingress_cidr_blocks" {
  description = "List of IPv4 CIDR ranges to use on all ingress rules"
  type        = list(string)
  default     = []
}

variable "ingress_rules" {
  description = "List of all ingress rules for cidr blocks"
  type        = list(string)
  default     = []
}

variable "ingress_with_cidr_blocks" {
  description = "List of computed ingress rules to create where 'cidr_blocks' is used"
  type        = list(map(string))
  default     = []
}

variable "ingress_with_self" {
  description = "List of ingress rules to create where 'self' is defined"
  type        = list(map(string))
  default     = []
}

variable "egress_with_source_security_group_id" {
  description = "List of egress rules to create where 'source_security_group_id' is used"
  type        = list(map(string))
  default     = []
}

variable "egress_cidr_blocks" {
  description = "List of IPv4 CIDR ranges to use on all egress rules"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "egress_rules" {
  description = "all egress rules"
  type        = list(string)
  default     = []
}

variable "egress_with_cidr_blocks" {
  description = "List of egress rules to create where 'cidr_blocks' is used"
  type        = list(map(string))
  default     = []
}

variable "egress_with_self" {
  description = "List of egress rules to create where 'self' is defined"
  type        = list(map(string))
  default     = []
}
