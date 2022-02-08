##############################################################################
# AWS Provider!..
##############################################################################

provider "aws" {
  region=var.region
  version ="~> 2.60"
}

data"aws_vpc""selected"{
id = var.vpc_id
}

data"aws_subnet_ids""selected"{
vpc_id = data.aws_vpc.selected.id
 
filter {
name   = "tag:Role"
values = [var.subnet_type]
  }
}

###############################################################################
# Security Group
###############################################################################

  module sg {
  source = "../../../../modules/security-groups"

  vpc_id                                  = var.vpc_id
  destination_cidr_block                  = var.destination_cidr_block
  security_group_cidr_block               = var.security_group_cidr_block
  security_group_description              = var.security_group_description
  ingress_ports                           = var.ingress_ports
  dynamic_ingress_description             = var.dynamic_ingress_description
  security_group_name                     = var.security_group_name
  security_group_role                     = var.security_group_role
  upsa_account_tags                       = module.upsa-tags.upsa_aws_cicd_dev_env_default_tags
  }                                                      

###############################################################################
# Autoscaling Group
###############################################################################

module asg {
  source = "../../../../modules/asg"

  asg_name                                = var.asg_name
  lc_name                                 = var.lc_name 
  image_id                                = var.image_id
  instance_type                           = var.instance_type
  health_check_type                       = var.health_check_type 
  min_size                                = var.min_size
  max_size                                = var.max_size
  desired_capacity                        = var.desired_capacity
  force_delete                            = var.force_delete
  health_check_grace_period               = var.health_check_grace_period
  wait_for_capacity_timeout               = var.wait_for_capacity_timeout
  alb_targetgroup_arn                     = module.alb.target_group_arns
  alb_targetgroup_arns                    = module.alb.target_group_arns  
  security_group_id                       = module.sg.id
  vpc_zone_identifier                     = data.aws_subnet_ids.selected.ids
  name_asg_policy_up                      = var.name_asg_policy_up
  scaling_adjustment_up                   = var.scaling_adjustment_up
  adjustment_type_up                      = var.adjustment_type_up
  cooldown_up                             = var.cooldown_up
  name_asg_policy_down                    = var.name_asg_policy_down
  scaling_adjustment_down                 = var.scaling_adjustment_down
  adjustment_type_down                    = var.adjustment_type_down
  cooldown_down                           = var.cooldown_down
}

###############################################################################
# Application Load Balancer
###############################################################################

module alb {
  source = "../../../../modules/alb"
  
  aws_lb_name             = var.aws_lb_name
  load_balancer_type      = var.load_balancer_type
  vpc_id                  = var.vpc_id
  security_groups         = [module.sg.id]
  internal                = var.internal
  subnets                 = data.aws_subnet_ids.selected.ids
  target_groups           = var.target_groups
  http_tcp_listeners      = var.http_tcp_listeners
  https_listeners         = var.https_listeners
  target_port             = var.target_port
  upsa_account_tags       = module.upsa-tags.upsa_aws_cicd_dev_env_default_tags
  
}

###############################################################################
# Tags
###############################################################################

module upsa-tags {
  source = "../../../../modules/upsa-tags"

}

