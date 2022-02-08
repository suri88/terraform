## Db Subnet Groups
variable "create_subnet" {
  description = " Whether to create a subnet group or not"
  type        = bool
  default     = true
}

variable "name_subnet_group" {
  description = "Creates a unique name for the db_subnet_group"
  type        = string
}

variable "identifier" {
  description = "The name of the RDS instance, if omitted, Terraform will assign a random, unique identifier"
  type        = string
}

variable "subnet_ids" {
  description = "A list of VPC subnet IDs"
  type        = list(string)
  default     = []
}

variable "db_subnet_group_tags" {
  description = "A mapping of tags to assign to db_subnet_group resources"
  type        = map(string)
  default     = {}
}

variable "create" {
  description = "Whether to create this ddb resource or not."
  type        = bool
  default     = false
}

variable "db_instance_tags" {
  description = "A mapping of tags to assign to db_instance resources"
  type        = map(string)
  default     = {}
}

variable "allocated_storage" {
  description = "Storage to be allocated to the RDS instance in GBs"
  type        = number
}


variable "engine_version" {
  description = "Engine version for the rds instance"
  type        = string
}

variable "instance_class" {
  description = "Instance class for the rds instance"
  type        = string
}

variable "username" {
  description = "User name for the RDS instance"
  type        = string
}

variable "password" {
  description = "Password for the username login"
  type        = string
}

#variable "family_parameter_group" {}

#variable "description_parameter_group" {}

variable "deletion_protection" {
  description = "Protects the database from being deleted accidentally. While this option is enabled, you can’t delete the database."
  type        = string
}


variable "multi_az" {
  description = "Multi-AZ deployment"
  type        = bool
}

variable "port" {
  description = "TCP/IP port that the database will use for application connections."
  type        = number
}


variable "backup_retention_period" {
  description = "Choose the number of days that RDS should retain automatic backups for this instance."
  type        = number
}

variable "db_subnet_group_role" {
  description = "Tags to be added to db subnet group"
  type        = string
}

variable "db_instance_role" {
  description = "Tags to be added to db instance"
  type        = string
}

variable "storage_type" {
  description = "One of 'standard' (magnetic), 'gp2' (general purpose SSD), or 'io1' (provisioned IOPS SSD). The default is 'io1' if iops is specified, 'standard' if not. Note that this behaviour is different from the AWS web console, where the default is 'gp2'."
  type        = string
  default     = "gp2"
}

variable "storage_encrypted" {
  description = "Specifies whether the DB instance is encrypted"
  type        = bool
  default     = false
}

variable "kms_key_id" {
  description = "The ARN for the KMS encryption key. If creating an encrypted replica, set this to the destination KMS ARN. If storage_encrypted is set to true and kms_key_id is not specified the default KMS key created in your account will be used"
  type        = string
  default     = ""
}

variable "license_model" {
  description = "License model information for this DB instance. Optional, but required for some DB engines, i.e. Oracle SE1"
  type        = string
  default     = ""
}

variable "engine" {
  description = "The database engine to use"
  type        = string
}

variable "name" {
  description = "The DB name to create. If omitted, no database is created initially"
  type        = string
  default     = ""
}

variable "final_snapshot_identifier" {
  description = "The name of your final DB snapshot when this DB instance is deleted."
  type        = string
  default     = null
}

variable "vpc_security_group_ids" {
  description = "List of VPC security groups to associate"
  type        = list(string)
  default     = []
}

variable "availability_zone" {
  description = "The Availability Zone of the RDS instance"
  type        = string
  default     = ""
}

variable "iops" {
  description = "The amount of provisioned IOPS. Setting this implies a storage_type of 'io1'"
  type        = number
  default     = 0
}

variable "publicly_accessible" {
  description = "Bool to control if instance is publicly accessible"
  type        = bool
  default     = false
}

variable "monitoring_interval" {
  description = "The interval, in seconds, between points when Enhanced Monitoring metrics are collected for the DB instance. To disable collecting Enhanced Monitoring metrics, specify 0. The default is 0. Valid Values: 0, 1, 5, 10, 15, 30, 60."
  type        = number
  default     = 0
}

variable "monitoring_role_arn" {
  description = "The ARN for the IAM role that permits RDS to send enhanced monitoring metrics to CloudWatch Logs. Must be specified if monitoring_interval is non-zero."
  type        = string
  default     = ""
}

variable "monitoring_role_name" {
  description = "Name of the IAM role which will be created when create_monitoring_role is enabled."
  type        = string
}

variable "iam_role_arn" {
  description = "The Amazon Resource Name (ARN) specifying the role."
  type        = string
}

variable "allow_major_version_upgrade" {
  description = "Indicates that major version upgrades are allowed. Changing this parameter does not result in an outage and the change is asynchronously applied as soon as possible"
  type        = bool
  default     = false
}

variable "auto_minor_version_upgrade" {
  description = "Indicates that minor engine upgrades will be applied automatically to the DB instance during the maintenance window"
  type        = bool
  default     = true
}


variable "maintenance_window" {
  description = "The window to perform maintenance in. Syntax: 'ddd:hh24:mi-ddd:hh24:mi'. Eg: 'Mon:00:00-Mon:03:00'"
  type        = string
}

variable "skip_final_snapshot" {
  description = "Determines whether a final DB snapshot is created before the DB instance is deleted. If true is specified, no DBSnapshot is created. If false is specified, a DB snapshot is created before the DB instance is deleted, using the value from final_snapshot_identifier"
  type        = bool
  default     = true
}

variable "copy_tags_to_snapshot" {
  description = "On delete, copy all Instance tags to the final snapshot (if final_snapshot_identifier is specified)"
  type        = bool
  default     = false
}


variable "backup_window" {
  description = "The daily time range (in UTC) during which automated backups are created if they are enabled. Example: '09:46-10:16'. Must not overlap with maintenance_window"
  type        = string
}

variable "tags" {
  description = "A mapping of tags to assign to all resources"
  type        = map(string)
  default     = {}
}

variable "character_set_name" {
  description = "(Optional) The character set name to use for DB encoding in Oracle instances. This can't be changed. See Oracle Character Sets Supported in Amazon RDS for more information"
  type        = string
  default     = ""
}

variable "ca_cert_identifier" {
  description = "Specifies the identifier of the CA certificate for the DB instance"
  type        = string
  default     = "rds-ca-2019"
}

# DB Options Group
variable "create_db_option_group" {
  description = "Whether to create this resource or not?"
  type        = bool
  default     = false
}

variable "name_db_option_group" {
  description = "Creates a unique name beginning with the specified prefix"
  type        = string
}

variable "option_group_description" {
  description = "The description of the option group"
  type        = string
  default     = ""
}

variable "major_engine_version" {
  description = "Specifies the major version of the engine that this option group should be associated with"
  type        = string
}

variable "options_group_tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}

variable "db_option_group_role" {
  description = " Role for the DB options group created"
  type        = string
}

## DB Parameter Group
variable "create_db_parameter_group" {
  description = "Whether to create the parameter group or not"
  type        = bool
  default     = true
}

variable "name_parameter_group" {
  description = "The name of the DB parameter group. If omitted, Terraform will assign a random, unique name."
  type        = string
}

variable "family" {
  description = "The family of the DB parameter group."
  type        = string
}

variable "db_parameter_group_tags" {
  description = "A mapping of tags to assign to db_parameter_group resources"
  type        = map(string)
  default     = {}
}

variable "db_parameter_role" {
  description = " Role for the DB Parameter group created"
  type        = string
}