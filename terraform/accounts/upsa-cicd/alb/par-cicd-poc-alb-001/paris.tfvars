region                 = "eu-west-3"

load_balancer_type     = "application"

aws_lb_role            = "application_loadbalancer"

aws_lb_name            = "par-cicd-poc-alb-001"

enable_deletion_protection = false

internal = true

#enable_cross_zone_load_balancing = false

################################ Internal ##########################################

vpc_id                    = "vpc-00073ae4160bbea68"
subnets		                = ["subnet-0914af53f5c1052f4", "subnet-07f5af903b7ea0e26"]
security_groups           = ["sg-0c551381019b2a6d9"]

############################### internet-facing  ##################################

#vpc_id                   = "vpc-0febac545e30ca061"
#subnets                  = ["subnet-0da942b855b41f6d3", "subnet-0f392232b87d6fa3b"]
#security_groups          = ["sg-0c551381019b2a6d9"]


############################### target_group_attachment ###########################

target_ids       = ["i-0b4b31248e8f829e0"]
target_port = 80

################################# target_groups #####################################
target_groups = [
    {
      vpc_id           = "vpc-00073ae4160bbea68"
      backend_protocol = "HTTP"
      backend_port     = 80
      target_type      = "instance"
      target_group_name = "cicd-poc-alb-tg-001"

      health_check = {
      path                = "/"
      timeout             = 5
      healthy_threshold   = 5
      unhealthy_threshold = 2
      interval            = 30
      matcher        = "200-399"
   }
 },
]
  
############################# http_tcp_listeners #########################################
 http_tcp_listeners = [
    # Forward action is default, either when defined or undefined
    {
      port               = 80
      protocol           = "HTTP"
      target_group_index = 0
      action_type        = "forward"
    }
]

################################ https_listeners  ######################################### 
https_listeners = [
    {
      port               = 443
      protocol           = "HTTPS"
      ssl_policy        = "ELBSecurityPolicy-2016-08"
      certificate_arn    = "arn:aws:acm:eu-west-3:762127463824:certificate/e4fb0a11-dc67-430b-a413-67b743f56a83"
      target_group_index = 0
    },
  ]