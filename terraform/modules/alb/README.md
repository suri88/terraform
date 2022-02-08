# AWS Application (ALB) Terraform module
ALB has the ability to replace what several ELBs can do by routing based on URI matchers. 
Additionally, operating at layer 7 opens the ability to shape traffic using WAF. AWS's documentation has a more exhaustive set of reasons. 
Alternatively, if using ALB with ECS look no further than the HashiCorp example.

#Terraform module which creates Application  resources on AWS
You want to create a set of resources around an application load balancer: namely associated target groups and listeners.
You've created a Virtual Private Cloud (VPC) and subnets where you intend to put this ALB.
You have one or more security groups to attach to the ALB.
Additionally, if you plan to use an HTTPS listener, the ARN of an SSL certificate is required.

#The module supports both (mutually exclusive):
Internal ALBs
External ALBs

## Terraform versions

| Name | Version |
|------|---------|
| terraform | ~> 0.12 |
| aws | ~> 2.64 |

## Providers

| Name | Version |
|------|---------|
| aws | ~> 2.64 |

## Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```
### Application Load Balancer
### Simple example:

HTTP and HTTPS listeners with default actions:
```bash
module "alb" {
  source = "../../../modules/alb"
  aws_lb_role 			= var.aws_lb_role
  aws_lb_name  			= var.aws_lb_name             
  load_balancer_type 	= var.load_balancer_type
  vpc_id             	= data.aws_vpc.example.id
  security_groups  		= var.security_groups
  internal           	= var.internal
  subnets             	= var.subnets 
 
  target_groups			= var.target_groups
  http_tcp_listeners 	= var.http_tcp_listeners
  https_listeners 		= var.https_listeners
  target_ids 			= var.target_ids
  port 					= var.port
  upsa_account_tags     = module.upsa-tags.upsa_aws_cicd_dev_env_default_tags

}
```
 
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| create\_lb | Controls if the Load Balancer should be created | `bool` | `true` | no |
| drop\_invalid\_header\_fields | Indicates whether invalid header fields are dropped in application load balancers. Defaults to false. | `bool` | `false` | no |
| enable\_cross\_zone\_load\_balancing | Indicates whether cross zone load balancing should be enabled in application load balancers. | `bool` | `false` | no |
| enable\_deletion\_protection | If true, deletion of the load balancer will be disabled via the AWS API. This will prevent Terraform from deleting the load balancer. Defaults to false. | `bool` | `true` | yes |
| enable\_http2 | Indicates whether HTTP/2 is enabled in application load balancers. | `bool` | `true` | no |
| extra\_ssl\_certs | A list of maps describing any extra SSL certificates to apply to the HTTPS listeners. Required key/values: certificate\_arn, https\_listener\_index (the index of the listener within https\_listeners which the cert applies toward). | `list(map(string))` | `[]` | no |
| http\_tcp\_listeners | A list of maps describing the HTTP listeners or TCP ports for this ALB. Required key/values: port, protocol. Optional key/values: target\_group\_index (defaults to http\_tcp\_listeners[count.index]) | `any` | `[]` | yes|
| https\_listeners | A list of maps describing the HTTPS listeners for this ALB. Required key/values: port, certificate\_arn. Optional key/values: ssl\_policy (defaults to ELBSecurityPolicy-2016-08), target\_group\_index (defaults to https\_listeners[count.index]) | `any` | `[]` | yes |
| idle\_timeout | The time in seconds that the connection is allowed to be idle. | `number` | `60` | no |
| internal | Boolean determining if the load balancer is internal or externally facing. | `bool` | `true` | yes |
| ip\_address\_type | The type of IP addresses used by the subnets for your load balancer. The possible values are ipv4 and dualstack. | `string` | `"ipv4"` | yes |
| lb\_tags | A map of tags to add to load balancer | `map(string)` | `{}` | no |
| listener\_ssl\_policy\_default | The security policy if using HTTPS externally on the load balancer. [See](https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-security-policy-table.html). | `string` | `"ELBSecurityPolicy-2016-08"` | yes |
| name | The resource name and Name tag of the load balancer. | `string` | `""` | yes|
| security\_groups | The security groups to attach to the load balancer. e.g. ["sg-0c551381019b2a6d9"] | `list(string)` | `[]` | yes |
| subnets | A list of subnets to associate with the load balancer. e.g. ['subnet-0914af53f5c1052f4','subnet-07f5af903b7ea0e26'] | `list(string)` | `[]` | yes |
| tags | A map of tags to add to all resources | `map(string)` | `{}` | yes |
| target\_group\_tags | A map of tags to add to all target groups | `map(string)` | `{}` | yes |
| target\_groups | A list of maps containing key/value pairs that define the target groups to be created. Order of these maps is important and the index of these are to be referenced in listener definitions. Required key/values: name, backend\_protocol, backend\_port | `any` | `[]` | yes |
| vpc\_id | VPC id where the load balancer and other resources will be deployed. | `string` | `""` | yes |

## Outputs

| Name | Description |
|------|-------------|

| default_target_group_arn | The default target group ARN |


<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

