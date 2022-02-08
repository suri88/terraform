variable security_group_description {
  description = "Default Security Group to Allow Local Access to the UPSA Network"
}
variable security_group_cidr_block {
   description = "security group_cider to associate with"
}

variable dynamic_ingress_description {}
variable ingress_ports {}

variable security_group_role {
   description = "The role of security_group"
}
variable security_group_name {
   description = "Name of be used security group "
}
variable destination_cidr_block {}

variable ami {
  description = "ID of AMI to use for the instance"
}

variable "region" {
  description = "Name of the selected region"
}

variable aws_instance_name {
  description = "Name to be used on instance"
}

variable key_name {
  description = "The key name to use for the instance"
}

variable "vpc_id" {
  description = "VPC ID to launch instance"
  default = ""
}

variable subnet_num {
  description = "Number to be used select to subnet"
  type = number
}

variable "instance_count" {
  description = "Number of instances to launch"
  type        = number
  default     = 1
}

variable associate_public_ip_address {
  description = "If true, the launched EC2 instance will have public ip"
  type        = bool
  default     = false
}

variable get_password_data {
  description = "If true, the launched EC2 instance will get the password(for windows machines)"
  type        = bool
  default     = true
}

variable "ebs_optimized" {
  description = "If true, the launched EC2 instance will be EBS-optimized"
  type        = bool
  default     = false
}


variable "instance_type" {
  description = "The type of instance to start"
  type        = string
  default     = ""
}

variable "instance_role" {
  description = "The role of instance to start"
  type        = string
  default     = ""
}

variable "security_group_id" {
  description = "A list of security group IDs to associate with"
  default = null
}

variable "private_ip" {
  description = "Private IP address to associate with the instance in a VPC"
  default     = ""
}

variable "ebs_block_device" {
  description = "Additional EBS block devices to attach to the instance"
  type        = list(map(string))
  default     = []
}
variable "root_block_device" {
  description = " root block devices to the instance"
  type        = list(map(string))
  default     = []
}

