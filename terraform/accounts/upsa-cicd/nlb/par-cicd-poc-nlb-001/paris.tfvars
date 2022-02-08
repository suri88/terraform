region                          = "eu-west-3"

aws_lb_role = "network_loadbalancer"

aws_lb_name = "par-cicd-poc-nlb-001"

load_balancer_type  = "network"

enable_deletion_protection = false

internal = true

#enable_cross_zone_load_balancing = false

###################### Internal  ########################
vpc_id                     = "vpc-00073ae4160bbea68"
subnets		                = ["subnet-0914af53f5c1052f4", "subnet-07f5af903b7ea0e26"]
target_ids                = ["i-0b4b31248e8f829e0"]
target_port = 80

####################  Internet-facing  #########################

#vpc_id    = "vpc-0febac545e30ca061"
#target_ids        = ["i-03a63a2b7d3b315b4", "i-0a4c4600bf03b9fa8"]
#target_port = 80
# subnet_mapping = [
#   { 
#     allocation_id = "eipalloc-02fe8feb6f9b883ec" 
#     subnet_id = "subnet-0f392232b87d6fa3b"
#  } ,
#  {
#    allocation_id = "eipalloc-05f18de2afd75001b" 
#     subnet_id = "subnet-0da942b855b41f6d3"
#  }
# ]

########################## target_groups #############################
 target_groups = [
{
      backend_protocol = "TCP"
      backend_port     = 80
      target_type      = "instance"
      target_group_name = "cicd-poc-nlb-tg-001"

      health_check = {
      path                = "/"
      timeout             = 6
      healthy_threshold   = 3
      unhealthy_threshold = 3
      interval            = 30
      matcher        = "200-399"
   }
 },
]

###################### https_listeners ###################
  https_listeners = [
    {
      port               = 443
      protocol           = "TLS"
      ssl_policy        = "ELBSecurityPolicy-2016-08"
      certificate_arn    = "arn:aws:acm:eu-west-3:762127463824:certificate/e4fb0a11-dc67-430b-a413-67b743f56a83"
      target_group_index = 0
    }
  ]

######################### http_tcp_listeners #####################
  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "TCP"
      target_group_index = 0
    }
  ]


 