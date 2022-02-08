# AWS RDS Terraform module

Terraform module which creates RDS resources on AWS.

These types of resources are supported:

* [DB Instance](https://www.terraform.io/docs/providers/aws/r/db_instance.html)
* [DB Subnet Group](https://www.terraform.io/docs/providers/aws/r/db_subnet_group.html)
* [DB Parameter Group](https://www.terraform.io/docs/providers/aws/r/db_parameter_group.html)
* [DB Option Group](https://www.terraform.io/docs/providers/aws/r/db_option_group.html)

Root module will create the below resources:

* [db_instance](https://www.terraform.io/docs/providers/aws/r/db_instance.html) - creates RDS DB instance
* [db_subnet_group](https://www.terraform.io/docs/providers/aws/r/db_subnet_group.html) - creates RDS DB subnet group
* [db_parameter_group](https://www.terraform.io/docs/providers/aws/r/db_parameter_group.html) - creates RDS DB parameter group
* [db_option_group](https://www.terraform.io/docs/providers/aws/r/db_option_group.html) - creates RDS DB option group

Refrences to the existing VPC id, IAM Role for DB Monitoring, DB Security Group has been made in which the DB will be created.

## Conditional creation

There is also a way to specify an existing database subnet group and parameter group name instead of creating new resources like this:

## This RDS instance will be created using a new database subnet and parameter group
```hcl
module "db" {
  source        = "../../../../modules/rds"
  create        = var.create
  create_subnet = var.create_subnet
  name_subnet_group           = var.name_subnet_group
  name_parameter_group        = var.name_parameter_group
  

  #... omitted

}
```


## Notes

1. This module does not create RDS security group.
2. To enable Multi-AZ, we need to make sure that backup_retention_period is not set to 0
3. For Multi-AZ only Standard and Enterprise Engine for database to be used.
4. Also verify the instance type supported for Multi-AZ.
5. If no value of kms_key_id is set, it will take the default kms key.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| publicly\_accessible | Bool to control if instance is publicly accessible | `bool` | `false` | no |
| create | Whether to create a database instance | `bool` | `true` | no |
| create\_subnet  | Whether to create a subnet group | `bool` | `true` | no |
| name\_subnet\_group  | Name of DB subnet group. DB instance will be created in the subnet group associated with the specified VPC. If unspecified, will be created in the default subnet group | `string` | `""` | no |
| vpc\_id  | The VPC under which the RDS Database will be created | `string` | `""` | no |
| identifier | The name of the RDS instance, if omitted, Terraform will assign a random, unique identifier | `string` | n/a | yes |
| allow\_major\_version\_upgrade | Indicates that major version upgrades are allowed. Changing this parameter does not result in an outage and the change is asynchronously applied as soon as possible | `bool` | `false` | no |
| backup\_window | The daily time range (in UTC) during which automated backups are created if they are enabled. Example: '09:46-10:16'. Must not overlap with maintenance\_window | `string` | n/a | yes |
| copy\_tags\_to\_snapshot | On delete, copy all Instance tags to the final snapshot (if final\_snapshot\_identifier is specified) | `bool` | `false` | no |
| maintenance\_window | The window to perform maintenance in. Syntax: 'ddd:hh24:mi-ddd:hh24:mi'. Eg: 'Mon:00:00-Mon:03:00' | `string` | n/a | yes |
| engine | The database engine to use | `string` | n/a | yes |
| engine\_version | The engine version to use | `string` | n/a | yes |
| instance\_class | The instance type of the RDS instance | `string` | n/a | yes |
| allocated\_storage | The allocated storage in gigabytes | `string` | n/a | yes |
| storage\_encrypted | Specifies whether the DB instance is encrypted | `bool` | `false` | no |
| kms\_key\_id | The ARN for the KMS encryption key. If creating an encrypted replica, set this to the destination KMS ARN. If storage\_encrypted is set to true and kms\_key\_id is not specified the default KMS key created in your account will be used | `string` | `""` | no |
| username | Username for the master DB user | `string` | n/a | yes |
| password | Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file | `string` | n/a | yes |
| storage\_type | One of 'standard' (magnetic), 'gp2' (general purpose SSD), or 'io1' (provisioned IOPS SSD). The default is 'io1' if iops is specified, 'standard' if not. Note that this behaviour is different from the AWS web console, where the default is 'gp2'. | `string` | `"gp2"` | no |
| iops | The amount of provisioned IOPS. Setting this implies a storage\_type of 'io1' | `number` | `0` | no |
| multi\_az | Specifies if the RDS instance is multi-AZ | `bool` | `false` | no |
| deletion\_protection | The database can't be deleted when this value is set to true. | `bool` | `false` | no |
| port | The port on which the DB accepts connections | `string` | n/a | yes |
| backup\_retention\_period | The days to retain backups for. To be enabled when using multi\_az option | `number` | `0` | no |
| skip\_final\_snapshot | Determines whether a final DB snapshot is created before the DB instance is deleted. If true is specified, no DBSnapshot is created. If false is specified, a DB snapshot is created before the DB instance is deleted, using the value from final\_snapshot\_identifier | `bool` | `true` | no |
| final\_snapshot\_identifier | The name of your final DB snapshot when this DB instance is deleted. | `string` | n/a | yes |
| aws\_security\_group\_name | The name of the VPC security group to which the DB is to be attached to. | `string` | n/a | `""` |
| db\_subnet\_group\_role | The role for the subnet group to be created. To be kept blank when using existing name\_subnet\_group | `string` | n/a | `""`
| db\_instance\_role  | The role for the subnet group to be created. To be kept blank when using existing name\_subnet\_group | `string` | n/a | `""`
| create\_db\_parameter\_group | Whether to create a database parameter group | `bool` | `true` | no |
| monitoring\_interval | The interval, in seconds, between points when Enhanced Monitoring metrics are collected for the DB instance. To disable collecting Enhanced Monitoring metrics, specify 0. The default is 0. Valid Values: 0, 1, 5, 10, 15, 30, 60. | `number` | `0` | no |
| monitoring\_role\_name | Name of the IAM role which will be created when create\_monitoring\_role is enabled. | `string` | `"rds-monitoring-role"` | no |
| auto\_minor\_version\_upgrade | Indicates that minor engine upgrades will be applied automatically to the DB instance during the maintenance window | `bool` | `true` | no |
| name\_parameter\_group  | Name of DB Parameter group. If unspecified, will be created in the default parameter\_group | `string` | `""` | no |
| db\_parameter\_role  | The role for the parameter group to be created for tagging. To be kept blank when using existing name\_parameter\_group | `string` | n/a | `""` |
| family | The family of the DB parameter group | `string` | `""` | no |
| create\_db\_option\_group | (Optional) Create a database option group | `bool` | `true` | no |
| name\_db\_option\_group | Name of the DB option group to associate | `string` | `""` | no |
| major\_engine\_version | Specifies the major version of the engine that this option group should be associated with. | `string` | `""` | yes
| option\_group\_description | The description of the option group | `string` | `""` | no |
| db\_option\_group\_role  | The role for the option group to be created for tagging. To be kept blank when using existing name\_db\_option\_group | `string` | n/a | `""` |





## Outputs

| Name | Description |
|------|-------------|
| enhanced\_monitoring\_iam\_role\_arn | The Amazon Resource Name (ARN) specifying the monitoring role |
| enhanced\_monitoring\_iam\_role\_name | The name of the monitoring role |
| this\_db\_instance\_address | The address of the RDS instance |
| this\_db\_instance\_arn | The ARN of the RDS instance |
| this\_db\_instance\_availability\_zone | The availability zone of the RDS instance |
| this\_db\_instance\_endpoint | The connection endpoint |
| this\_db\_instance\_id | The RDS instance ID |
| this\_db\_instance\_name | The database name |
| this\_db\_instance\_password | The database password (this password may be old, because Terraform doesn't track it after initial creation) |
| this\_db\_instance\_port | The database port |
| this\_db\_instance\_resource\_id | The RDS Resource ID of this instance |
| this\_db\_instance\_status | The RDS instance status |
| this\_db\_instance\_username | The master username for the database |
| this\_db\_option\_group\_arn | The ARN of the db option group |
| this\_db\_option\_group\_id | The db option group id |
| this\_db\_parameter\_group\_id | The db parameter group id |
| this\_db\_subnet\_group\_arn | The ARN of the db subnet group |
| this\_db\_subnet\_group\_id | The db subnet group name |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
