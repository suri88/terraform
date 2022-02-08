
variable region {
  description = "Name of the selected region"
}


variable ami {
  description = "ID of AMI to use for the instance"
}

variable aws_instance_name {
  description = "Name to be used on instance"
}

variable key_name {
  description = "The key name to use for the instance"
}

variable vpc_id {
  description = "VPC ID to launch instance"
  default = ""
}

variable subnet_id {
  description = "Subnet id to launch instance"
  default = ""
}
variable subnet_type {
  description = "Subnet type to launch instance"
  type =string
  default = ""
}

variable subnet_num {
  description = "Number to be used select to subnet"
  type = number
} 

variable instance_count {
  description = "Number of instances to launch"
  type        = number  
  default     = 1
}

variable security_group_ids {
  description = "List of security group ids to attach to the instance"
  type        = list(string)
  default     = []
}


variable ebs_optimized {
  description = "If true, the launched EC2 instance will be EBS-optimized"
  type        = bool
  default     = false
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

variable instance_type {
  description = "The type of instance to start"
  type        = string
  default     = ""
}

variable instance_role {
  description = "The role of instance to start"
  type        = string
  default     = ""
}

variable private_ip {
  description = "Private IP address to associate with the instance in a VPC"
  default     = ""
}

variable ebs_block_device {
  description = "Additional EBS block devices to attach to the instance"
  type        = list(map(string))
  default     = []
}
variable root_block_device {
  description = " root block devices to the instance"
  type        = list(map(string))
  default     = []
}
