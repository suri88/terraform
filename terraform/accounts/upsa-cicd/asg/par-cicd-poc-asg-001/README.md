# UPSA - ASG creation


This module creates Autoscaling group along with the launch configruation and a security group for the instances. This Module hooks an Application Load Balancer and thus traffic will be automatically allowed into the ASG from the ALB. Extensive options also exist for controlling various parts of the ASG, launch configuration, and ALB targets.

## Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```
Usage Example:
--------------

module asg {  
  source = "../../../modules/asg"    

  asg_name                                = var.asg_name  
  image_id                                = var.image_id  
  instance_type                           = var.instance_type  
  health_check_type                       = var.health_check_type   
  min_size                                = var.min_size  
  max_size                                = var.max_size  
  desired_capacity                        = var.desired_capacity  
  force_delete                            = var.force_delete  
  health_check_grace_period               = var.health_check_grace_period  
  wait_for_capacity_timeout               = var.wait_for_capacity_timeout  
  alb_targetgroup_arn                     = module.alb.alb_targetgroup_arn  
  alb_targetgroup_arns                    = module.alb.alb_targetgroup_arns   
  security_group_id                       = module.sg.id  
  vpc_zone_identifier                     = data.aws_subnet_ids.selected.ids  
}  

module alb {  
  source = "../../../modules/loadbalancer"  
  
  name                = var.name  
  load_balancer_type  = var.load_balancer_type  
  vpc_id              = var.vpc_id  
  security_groups     = [module.sg.id]    
  internal            = var.internal     
  subnets             = data.aws_subnet_ids.selected.ids    
  target_groups       = var.target_groups  
  http_tcp_listeners  = var.http_tcp_listeners  
}  


## Requirements

| Name | Version |
|------|---------|
| terraform | ~> 0.12 |
| aws | ~> 2.60 |

## Providers

| Name | Version |
|------|---------|
| aws | ~> 2.60 |

## Inputs

| Name | Description | Type | Default |
|------|-------------|------|---------|
| asg\_name | Creates a unique name for autoscaling group beginning with the specified prefix | `string` | `""` |
| associate\_public\_ip\_address | Associate a public ip address with an instance in a VPC | `bool` | `false` |
| create\_asg | Whether to create autoscaling group | `bool` | `true` |
| create\_asg\_with\_initial\_lifecycle\_hook | Create an ASG with initial lifecycle hook | `bool` | `false` |
| create\_lc | Whether to create launch configuration | `bool` | `true` |
| default\_cooldown | The amount of time, in seconds, after a scaling activity completes before another scaling activity can start | `number` | `300` |
| desired\_capacity | The number of Amazon EC2 instances that should be running in the group | `string` | n/a | 
| ebs\_block\_device | Additional EBS block devices to attach to the instance | `list(map(string))` | `[]` |
| ebs\_optimized | If true, the launched EC2 instance will be EBS-optimized | `bool` | `false` |
| enable\_monitoring | Enables/disables detailed monitoring. This is enabled by default. | `bool` | `true` |
| enabled\_metrics | A list of metrics to collect. The allowed values are GroupMinSize, GroupMaxSize, GroupDesiredCapacity, GroupInServiceInstances, GroupPendingInstances, GroupStandbyInstances, GroupTerminatingInstances, GroupTotalInstances | `list(string)` | <pre>[<br>  "GroupMinSize",<br>  "GroupMaxSize",<br>  "GroupDesiredCapacity",<br>  "GroupInServiceInstances",<br>  "GroupPendingInstances",<br>  "GroupStandbyInstances",<br>  "GroupTerminatingInstances",<br>  "GroupTotalInstances"<br>]</pre> | 
| ephemeral\_block\_device | Customize Ephemeral (also known as 'Instance Store') volumes on the instance | `list(map(string))` | `[]` |
| force\_delete | Allows deleting the autoscaling group without waiting for all instances in the pool to terminate. You can force an autoscaling group to delete even if it's in the process of scaling a resource. Normally, Terraform drains all the instances before deleting the group. This bypasses that behavior and potentially leaves resources dangling | `bool` | `false` |
| health\_check\_grace\_period | Time (in seconds) after instance comes into service before checking health | `number` | `300` |
| health\_check\_type | Controls how health checking is done. Values are - EC2 and ELB | `string` | n/a |
| iam\_instance\_profile | The IAM instance profile to associate with launched instances | `string` | `""` |
| image\_id | The EC2 image ID to launch | `string` | `""` |
| initial\_lifecycle\_hook\_default\_result | Defines the action the Auto Scaling group should take when the lifecycle hook timeout elapses or if an unexpected failure occurs. The value for this parameter can be either CONTINUE or ABANDON | `string` | `"ABANDON"` |
| initial\_lifecycle\_hook\_heartbeat\_timeout | Defines the amount of time, in seconds, that can elapse before the lifecycle hook times out. When the lifecycle hook times out, Auto Scaling performs the action defined in the DefaultResult parameter | `string` | `"60"` |
| initial\_lifecycle\_hook\_lifecycle\_transition | The instance state to which you want to attach the initial lifecycle hook | `string` | `""` |
| initial\_lifecycle\_hook\_name | The name of initial lifecycle hook | `string` | `""` |
| initial\_lifecycle\_hook\_notification\_metadata | Contains additional information that you want to include any time Auto Scaling sends a message to the notification target | `string` | `""` |
| initial\_lifecycle\_hook\_notification\_target\_arn | The ARN of the notification target that Auto Scaling will use to notify you when an instance is in the transition state for the lifecycle hook. This ARN target can be either an SQS queue or an SNS topic | `string` | `""` |
| initial\_lifecycle\_hook\_role\_arn | The ARN of the IAM role that allows the Auto Scaling group to publish to the specified notification target | `string` | `""` |
| instance\_type | The size of instance to launch | `string` | `""` |
| key\_name | The key name that should be used for the instance | `string` | `""` |
| launch\_configuration | The name of the launch configuration to use (if it is created outside of this module) | `string` | `""` |
| lc\_name | Creates a unique name for launch configuration beginning with the specified prefix | `string` | `""` |
| load\_balancers | A list of elastic load balancer names to add to the autoscaling group names | `list(string)` | `[]` |
| max\_instance\_lifetime | The maximum amount of time, in seconds, that an instance can be in service, values must be either equal to 0 or between 604800 and 31536000 seconds. | `number` | `0` |
| max\_size | The maximum size of the auto scale group | `string` | n/a |
| metrics\_granularity | The granularity to associate with the metrics to collect. The only valid value is 1Minute | `string` | `"1Minute"` |
| min\_elb\_capacity | Setting this causes Terraform to wait for this number of instances to show up healthy in the ELB only on creation. Updates will not wait on ELB instance number changes | `number` | `0` |
| min\_size | The minimum size of the auto scale group | `string` | n/a |
| name | Creates a unique name beginning with the specified prefix | `string` | n/a |
| placement\_group | The name of the placement group into which you'll launch your instances, if any | `string` | `""` |
| placement\_tenancy | The tenancy of the instance. Valid values are 'default' or 'dedicated' | `string` | `"default"` |
| protect\_from\_scale\_in | Allows setting instance protection. The autoscaling group will not select instances with this setting for termination during scale in events. | `bool` | `false` |
| recreate\_asg\_when\_lc\_changes | Whether to recreate an autoscaling group when launch configuration changes | `bool` | `false` |
| root\_block\_device | Customize details about the root block device of the instance | `list(map(string))` | `[]` |
| security\_groups | A list of security group IDs to assign to the launch configuration | `list(string)` | `[]` |
| service\_linked\_role\_arn | The ARN of the service-linked role that the ASG will use to call other AWS services. | `string` | `""` |
| spot\_price | The price to use for reserving spot instances | `string` | `""` |
| suspended\_processes | A list of processes to suspend for the AutoScaling Group. The allowed values are Launch, Terminate, HealthCheck, ReplaceUnhealthy, AZRebalance, AlarmNotification, ScheduledActions, AddToLoadBalancer. Note that if you suspend either the Launch or Terminate process types, it can prevent your autoscaling group from functioning properly. | `list(string)` | `[]` |
| tags | A list of tag blocks. Each element should have keys named key, value, and propagate\_at\_launch. | `list(map(string))` | `[]` |
| tags\_as\_map | A map of tags and values in the same format as other resources accept. This will be converted into the non-standard format that the aws\_autoscaling\_group requires. | `map(string)` | `{}` |
| target\_group\_arns | A list of aws\_alb\_target\_group ARNs, for use with Application Load Balancing | `list(string)` | `[]` |
| termination\_policies | A list of policies to decide how the instances in the auto scale group should be terminated. The allowed values are OldestInstance, NewestInstance, OldestLaunchConfiguration, ClosestToNextInstanceHour, Default | `list(string)` | <pre>[<br>  "Default"<br>]</pre> |
| user\_data | The user data to provide when launching the instance | `string` | `" "` |
| vpc\_zone\_identifier | A list of subnet IDs to launch resources in | `list(string)` | n/a |
| wait\_for\_capacity\_timeout | A maximum duration that Terraform should wait for ASG instances to be healthy before timing out. (See also Waiting for Capacity below.) Setting this to '0' causes Terraform to skip all Capacity Waiting behavior. | `string` | `"10m"` |
| wait\_for\_elb\_capacity | Setting this will cause Terraform to wait for exactly this number of healthy instances in all attached load balancers on both create and update operations. Takes precedence over min\_elb\_capacity behavior. | `number` | `null` |

## Outputs

| Name | Description |
|------|-------------|
| this\_autoscaling\_group\_arn | The ARN for this AutoScaling Group |
| this\_autoscaling\_group\_availability\_zones | The availability zones of the autoscale group |
| this\_autoscaling\_group\_default\_cooldown | Time between a scaling activity and the succeeding scaling activity |
| this\_autoscaling\_group\_desired\_capacity | The number of Amazon EC2 instances that should be running in the group |
| this\_autoscaling\_group\_health\_check\_grace\_period | Time after instance comes into service before checking health |
| this\_autoscaling\_group\_health\_check\_type | EC2 or ELB. Controls how health checking is done |
| this\_autoscaling\_group\_id | The autoscaling group id |
| this\_autoscaling\_group\_load\_balancers | The load balancer names associated with the autoscaling group |
| this\_autoscaling\_group\_max\_size | The maximum size of the autoscale group |
| this\_autoscaling\_group\_min\_size | The minimum size of the autoscale group |
| this\_autoscaling\_group\_name | The autoscaling group name |
| this\_autoscaling\_group\_target\_group\_arns | List of Target Group ARNs that apply to this AutoScaling Group |
| this\_autoscaling\_group\_vpc\_zone\_identifier | The VPC zone identifier |
| this\_launch\_configuration\_id | The ID of the launch configuration |
| this\_launch\_configuration\_name | The name of the launch configuration |

