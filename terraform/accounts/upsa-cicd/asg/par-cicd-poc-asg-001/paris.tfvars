###############################################################################
# Base Network
###############################################################################

vpc_id                                  = "vpc-00073ae4160bbea68"
subnet_type                             = "app" 

###############################################################################
# Launch Configuration
###############################################################################

region                                  = "eu-west-3"
image_id                                = "ami-00077e3fed5089981"                  
instance_type                           = "t2.micro"  
lc_name                                 = "test_lc_asg" 

###############################################################################
# ASG 
###############################################################################
  
asg_name                                = "test-autoscaling-group"    
availability_zones                      = ["eu-west-3a", "eu-west-3b", "eu-west-3c"]  
health_check_type                       = "ELB"                
min_size                                = 2                    
max_size                                = 5                     
desired_capacity                        = 2             
wait_for_capacity_timeout               = "3m" 
force_delete                            = true
health_check_grace_period               = 300
name_asg_policy_up                      = "web_policy_up"
scaling_adjustment_up                   = 1
adjustment_type_up                      = "ChangeInCapacity"
cooldown_up                             = 300
name_asg_policy_down                    = "web_policy_down"
scaling_adjustment_down                 = -1
adjustment_type_down                    = "ChangeInCapacity"
cooldown_down                           = 300


###############################################################################
# ELB
###############################################################################

# healthy_threshold                       = 2
# unhealthy_threshold                     = 2
# internal                                = true
# timeout                                 = 3
# interval                                = 30
# target                                  = "HTTP:80/"
# lb_port                                 = 80
# lb_protocol                             = "http"
# instance_port                           = 80
# instance_protocol                       = "http"


###############################################################################
# Security Group
###############################################################################

# Creates a tag with key of 'Name' and a value that you specify
security_group_name           = "par-cicd-dev-asg-test-local-access-vpc002-sg002"
security_group_role           = "UPSA Network Local Access"
ingress_ports                 = [ 0 ]
security_group_cidr_block     = "10.0.0.0/24"
security_group_description    = "Default Security Group to Allow Local Access to the UPSA Network"
dynamic_ingress_description   = "UPSA-NETWORK"
destination_cidr_block        = "0.0.0.0/0"


###############################################################################
# ALB
###############################################################################

aws_lb_name                   = "test-alb-asg"
aws_lb_role                   = "application_loadbalancer"
load_balancer_type            = "application"
internal                      = true

target_groups = [
    {
      vpc_id           = "vpc-00073ae4160bbea68"
      backend_protocol = "HTTP"
      backend_port     = 80
      target_type      = "instance"
      target_group_name = "test-asg-tg"

      health_check = {
      path                = "/"
      timeout             = 5
      healthy_threshold   = 5
      unhealthy_threshold = 2
      interval            = 30
      matcher        = "200-302"
   }
 },
]
  
 http_tcp_listeners = [
    # Forward action is default, either when defined or undefined
    {
      port               = 80
      protocol           = "HTTP"
      target_group_index = 0
      action_type        = "forward"
    }
]

https_listeners = [
    {
      port               = 443
      protocol           = "HTTPS"
      ssl_policy         = "ELBSecurityPolicy-2016-08"
      certificate_arn    = "arn:aws:acm:eu-west-3:762127463824:certificate/e4fb0a11-dc67-430b-a413-67b743f56a83"
      target_group_index = 0
    },
  ]
  
