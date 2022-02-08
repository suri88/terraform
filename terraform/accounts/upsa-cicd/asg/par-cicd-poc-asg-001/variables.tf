######################################
# Expected values from the caller
######################################

variable region {}
variable subnet_type {}
variable vpc_id {} 

#####################################
#Launch Config
#####################################

variable image_id {}                           
variable instance_type {}  
variable lc_name {
  description = "Name of Launch Configuration"
  type        = string
  default     = ""
} 

######################################
# Autoscaling group
######################################

                         
variable health_check_type {}                     
variable min_size {}                             
variable max_size {}                             
variable desired_capacity {}   
variable wait_for_capacity_timeout {}  
variable force_delete {
  description = "Boolean determining if the force delete is true or false"
  type        = bool
  default     = true
}
variable health_check_grace_period {
  description = "ASG health check grace period"
  type        = number
  default     = 300
}
variable asg_name {
  description = "Name of the ASG"
  type        = string
  default     = ""
}
variable availability_zones {
  description = "Availability zones for AutoScaling Group"
  type        = list(string)
  default     = []
}

         

######################################
# Elastic Load Balancer
######################################

/* healthy_threshold {}                          
variable unhealthy_threshold {}                     
variable timeout {}                             
variable interval {}  
variable internal {}                           
variable target {}   
variable lb_port {}
variable lb_protocol {}                          
variable instance_port {}                     
variable instance_protocol {}*/

######################################
# Security Group
######################################

variable security_group_name {}
variable security_group_description {}
variable security_group_cidr_block {}
variable dynamic_ingress_description {}
variable ingress_ports {}
variable security_group_role {} 
variable destination_cidr_block {}
  

######################################
# ALB
######################################

variable "aws_lb_name" {
  description = "The resource name and Name tag of the load balancer."
  type        = string
  default     = null
}
variable aws_lb_role {
   description = "Role to be used on alb"
   type = string
   default = ""
}
variable "internal" {
  description = "Boolean determining if the load balancer is internal or externally facing."
  type        = bool
  default     = true
}
variable "load_balancer_type" {
  description = "The type of load balancer to create. Possible values are application or network."
  type        = string
  default     = "application"
}
variable "target_groups" {
  description = "A list of maps containing key/value pairs that define the target groups to be created. Order of these maps is important and the index of these are to be referenced in listener definitions. Required key/values: name, backend_protocol, backend_port"
  type        = any
  default     = []
}
variable "https_listeners" {
  description = "A list of maps describing the HTTPS listeners for this ALB. Required key/values: port, certificate_arn. Optional key/values: ssl_policy (defaults to ELBSecurityPolicy-2016-08), target_group_index (defaults to https_listeners[count.index])"
  type        = any
  default     = []
}
variable "http_tcp_listeners" {
  description = "A list of maps describing the HTTPS listeners for this ALB. Required key/values: port, certificate_arn. Optional key/values: ssl_policy (defaults to ELBSecurityPolicy-2016-08), target_group_index (defaults to https_listeners[count.index])"
  type        = any
  default     = []
}
variable "subnets" {
  description = "A list of subnets to associate with the load balancer. e.g. ['subnet-1a2b3c4d','subnet-1a2b3c4e','subnet-1a2b3c4f']"
  type        = list(string)
  default     = null
}
variable "create_lb" {
  description = "Controls if the Load Balancer should be created"
  type        = bool
  default     = true
}
# variable "port" {
# description = "A port associate with aws_lb_target_group_attachment"
# type = number
# }

variable "target_port" {
description = "A port associate with aws_lb_target_group_attachment"
type = number
default =null
}

variable name_asg_policy_up {
  description = "Name of the web policy up"
  default = ""
}
variable scaling_adjustment_up {
  description = "Scaling adjustment of the web policy up"
  default = ""
}
variable adjustment_type_up {
  description = "adjustment type of the web policy up"
  default = ""
}
variable cooldown_up  {
  description = "Cooldown time for the web policy up"
  default = ""
}
variable name_asg_policy_down {
  description = "Name of the web policy up"
  default = ""
}
variable scaling_adjustment_down {
  description = "Scaling adjustment of the web policy up"
  default = ""
}
variable adjustment_type_down {
  description = "adjustment type of the web policy up"
  default = ""
}
variable cooldown_down  {
  description = "Cooldown time for the web policy up"
  default = ""
}


