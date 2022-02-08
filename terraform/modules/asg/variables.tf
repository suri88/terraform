###############################################################################
# Expected values from the caller
###############################################################################

variable server_port {
  description = "The server port of httpd server"
  default     = 8080
}


# Launch Configuration
variable instance_type {
  description = "The type of EC2 Instances to run (e.g. t2.micro)"
  default = ""
}
variable image_id {
  description = "AWS Image Id of t2.micro ec2 instance"
  default = ""
}
variable security_group_id {
  description = "Id of the secuity group"
  default = ""
}
variable lc_name {
  description = "Name of the Launch Configuration"
  default = ""
}


# Autoscaling Group
variable asg_name {
  description = "Name of the ASG"
  default = ""
}
variable availability_zones {
  description = "Availability zones for AutoScaling Group"
  default = ""
}
variable min_size {
  description = "The minimum number of EC2 Instances in the ASG"
  default = ""
}
variable max_size {
  description = "The maximum number of EC2 Instances in the ASG"  
  default = ""
}
variable health_check_type {
  description = "Health check type of ASG"
  default = ""
}
variable desired_capacity {
  description = "Desired Capacity of ASG"
  default     = ""
}
variable wait_for_capacity_timeout {
  description = "wait time before ec2 health check"
  default     = ""
}
variable "vpc_zone_identifier" {
  description = "A list of subnets to associate with the load balancer. e.g. ['subnet-1a2b3c4d','subnet-1a2b3c4e','subnet-1a2b3c4f']"
  type        = list(string)
  default     = null
}
variable alb_targetgroup_arn {
  description = "Target group ARN"
  type        =  list(string)
  default     = []
}
variable alb_targetgroup_arns {
  description = "Target group ARN"
  type        = list(string)
  default     = []
}
variable health_check_grace_period {
  description = "ASG health check grace period"
  type        = number
}
variable force_delete {
  description = "Boolean determining if the force delete is true or false"
  type        = bool
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