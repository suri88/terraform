# UPSA - EC2 instance creation

Configuration in this directory creates EC2 instances with different sets of arguments (with Private IP, with VPC_Id, with Security-groups, with EBS Block Volumes, with credit specifications).
This outputs the Private IP and the Get Admin password.

## Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```
Note that this EC2 instance may create resources which can cost money. Run `terraform destroy` when you don't need these resources.

Terraform Module for provisioning a general purpose EC2 host.


### Simple example:

module "ec2" {
  source = "../../../../modules/ec2"
  instance_count               = var.instance_count
  aws_instance_name            = var.aws_instance_name
  instance_role                = var.instance_role
  ami                          = var.ami
  instance_type                = var.instance_type
  key_name                     = var.key_name
  private_ip                   = var.private_ip
  subnet_id                    = var.subnet_id
  vpc_security_group_ids       = var.security_group_ids
  associate_public_ip_address  = var.associate_public_ip_address
  get_password_data            = var.get_password_data
  root_block_device            = var.root_block_device
  ebs_block_device             = var.ebs_block_device
  upsa_account_tags            = module.upsa-tags.upsa_aws_cicd_dev_env_default_tags

}



## Inputs

| Name | Description |
|------|-------------|
| ami | The AMI to use for the instance. By default it is the AMI provided by Windows-2019 |
| region | AWS Region the instance is launched in |
| aws_instance_name | Name  (e.g. `bastion` or `db`) | 
| instance_type | The type of the instance | string | 
| private_ip | Private IP address to associate with the instance in the VPC | 
| instance_role|The role of instance to start(eg 'POC')| 
| tags | Additional tags | map(string) | 
| subnet | VPC Subnet ID the instance is launched in |
| key_name | key_name (e.g upsa-cicd-dev) | string | no |
| vpc_id | The ID of the VPC that the instance security group belongs to | 
| create_security_group | Create Security Group with Ingress and Egress traffic allowed | 
| ebs_device_name | Name of the EBS device  | list(string) | 
| ebs_optimized | Launched EC2 instance will be EBS-optimized | 
| ebs_volume_size | Size of the EBS volume in gigabytes | 
| ebs_volume_type | The type of EBS volume. Can be standard, gp2  | 
| root_volume_size | Size of the root volume in gigabytes | number |  
| root_volume_type | Type of root volume. Can be standard, gp2 | 
| environment | Environment, e.g. 'prod', 'staging', 'dev', 'pre-prod', 'UAT' | 
| stage | Stage (e.g. `prod`, `dev`, `staging` | 


## Outputs

| Name | Description |
|------|-------------|
| get password_data | List of Base-64 encoded encrypted password data for the instance |
| private_ip | List of private IP addresses assigned to the instances |


## DevOps 

 get everything you need from the ground up built using 100% infrastructure as code.
 we build end-to-end CI/CD with unlimited staging environments.






