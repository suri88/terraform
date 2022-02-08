# DB Subnet Group
output "this_db_subnet_group_id" {
  description = "The db subnet group name"
  value       = element(concat(aws_db_subnet_group.this.*.id, [""]), 0)
}

output "this_db_subnet_group_arn" {
  description = "The ARN of the db subnet group"
  value       = element(concat(aws_db_subnet_group.this.*.arn, [""]), 0)
}

#DB Instance

output "this_db_instance_multi_az" {
  description = "If the RDS instance is multi AZ enabled."
  value       = element(concat(aws_db_instance.this_mssql.*.multi_az, [""]), 0)
}
# DB Options group
/*output "this_db_option_group_id" {
  description = "The db option group id"
  value       = element(concat(aws_db_option_group.this.*.id, [""]), 0)
}

output "this_db_option_group_arn" {
  description = "The ARN of the db option group"
  value       = element(concat(aws_db_option_group.this.*.arn, [""]), 0)
}
*/
# DB Parameter Group  
output "this_db_parameter_group_id" {
  description = "The db parameter group id"
  value       = local.this_db_parameter_group_id
}

locals {
  this_db_instance_address           = element(concat(aws_db_instance.this_mssql.*.address, [""]), 0)
  this_db_instance_arn               = element(concat(aws_db_instance.this_mssql.*.arn, [""]), 0)
  this_db_instance_availability_zone = element(concat(aws_db_instance.this_mssql.*.availability_zone, [""]), 0)
  this_db_instance_endpoint          = element(concat(aws_db_instance.this_mssql.*.endpoint, [""]), 0)
  this_db_instance_id                = element(concat(aws_db_instance.this_mssql.*.id, [""]), 0)
  this_db_instance_resource_id       = element(concat(aws_db_instance.this_mssql.*.resource_id, [""]), 0)
  this_db_instance_status            = element(concat(aws_db_instance.this_mssql.*.status, [""]), 0)
  this_db_instance_name              = element(concat(aws_db_instance.this_mssql.*.name, [""]), 0)
  this_db_instance_username          = element(concat(aws_db_instance.this_mssql.*.username, [""]), 0)
  this_db_instance_password          = element(concat(aws_db_instance.this_mssql.*.password, [""]), 0)
  this_db_instance_port              = element(concat(aws_db_instance.this_mssql.*.port, [""]), 0)
  this_db_multi_az                   = element(concat(aws_db_instance.this_mssql.*.multi_az, [""]), 0)
  this_db_parameter_group_id         = element(concat(aws_db_parameter_group.this.*.id, [""]), 0)
}

output "this_db_instance_address" {
  description = "The address of the RDS instance"
  value       = local.this_db_instance_address
}

output "this_db_multi_az" {
  description = "If the RDS instance is multi AZ enabled."
  value       = local.this_db_multi_az
}
output "this_db_instance_arn" {
  description = "The ARN of the RDS instance"
  value       = local.this_db_instance_arn
}

output "this_db_instance_availability_zone" {
  description = "The availability zone of the RDS instance"
  value       = local.this_db_instance_availability_zone
}

output "this_db_instance_endpoint" {
  description = "The connection endpoint"
  value       = local.this_db_instance_endpoint
}

output "this_db_instance_id" {
  description = "The RDS instance ID"
  value       = local.this_db_instance_id
}

output "this_db_instance_resource_id" {
  description = "The RDS Resource ID of this instance"
  value       = local.this_db_instance_resource_id
}

output "this_db_instance_status" {
  description = "The RDS instance status"
  value       = local.this_db_instance_status
}

output "this_db_instance_username" {
  description = "The master username for the database"
  value       = local.this_db_instance_username
}

output "this_db_instance_password" {
  description = " The database password (this password may be old, because Terraform doesn't track it after initial creation)"
  value = local.this_db_instance_password
  sensitive   = true
}

output "this_db_instance_port" {
  description = "The database port"
  value       = local.this_db_instance_port
}


