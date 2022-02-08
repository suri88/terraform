###########################################################
# This is where we define our Launch Configuration
###########################################################

resource "aws_launch_configuration" "launch-config" {
  image_id                     = var.image_id
  instance_type                = var.instance_type
  name                         = var.lc_name
  security_groups              = [var.security_group_id]
   
  lifecycle {
    create_before_destroy = true
  }
}

###########################################################
# This is where we define our Autoscaling Group
###########################################################

resource "aws_autoscaling_group" "asg" {
  launch_configuration        = aws_launch_configuration.launch-config.id
  name                        = var.asg_name
  availability_zones          = [var.availability_zones]
  health_check_type           = var.health_check_type 
  min_size                    = var.min_size
  max_size                    = var.max_size  
  desired_capacity            = var.desired_capacity 
  wait_for_capacity_timeout   = var.wait_for_capacity_timeout 
  health_check_grace_period   = var.health_check_grace_period
  force_delete                = var.force_delete
  vpc_zone_identifier         = var.vpc_zone_identifier
  target_group_arns           = var.alb_targetgroup_arns
  
  lifecycle {
    create_before_destroy = true
  }

  tag {
    key                       = "Name"
    value                     = "ec2-autoscaling-group-test"
    propagate_at_launch       = true
  }

}

###########################################################
# Attaching ALB with ASG
###########################################################

resource "aws_autoscaling_attachment" "asg_alb_attachment" {
  alb_target_group_arn      =  var.alb_targetgroup_arn[0]
  autoscaling_group_name    = aws_autoscaling_group.asg.id               
}

###########################################################
# This is where we define our Autoscaling Policy
###########################################################

resource "aws_autoscaling_policy" "web_policy_up" {
  name                = var.name_asg_policy_up
  scaling_adjustment  = var.scaling_adjustment_up  
  adjustment_type     = var.adjustment_type_up  
  cooldown            = var.cooldown_up  
  autoscaling_group_name =  aws_autoscaling_group.asg.name
}

resource "aws_autoscaling_policy" "web_policy_down" {
  name                = var.name_asg_policy_down 
  scaling_adjustment  = var.scaling_adjustment_down
  adjustment_type     = var.adjustment_type_down 
  cooldown            = var.cooldown_down  
  autoscaling_group_name = aws_autoscaling_group.asg.name
}
