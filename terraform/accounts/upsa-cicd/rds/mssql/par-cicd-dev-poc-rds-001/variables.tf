variable "region" {}

variable "vpc_id" {
  description = "VPC in which the RDS instance is to be provisioned"
  type        = string
}

variable "identifier" {
  description = "The name of the RDS instance, if omitted, Terraform will assign a random, unique identifier"
  type        = string
}

variable "engine" {
  description = "Type of the RDS engine to be provisioned"
  type        = string
}

variable "engine_version" {
  description = "Engine version for the rds instance"
  type        = string
}

variable "instance_class" {
  description = "Instance class for the rds instance"
  type        = string
}

variable "allocated_storage" {
  description = "Storage to be allocated to the RDS instance in GBs"
  type        = number
}
variable "storage_encrypted" {
  description = "Choose to encrypt the given instance storage."
  type        = bool
}

variable "username" {
  description = "User name for the RDS instance"
  type        = string
}

/*variable "password" {
  description = "Password for the username login"
  type        = string
}*/


variable "kms_key_id" {
  description = "The ARN for the KMS encryption key. If creating an encrypted replica, set this to the destination KMS ARN. If storage_encrypted is set to true and kms_key_id is not specified the default KMS key created in your account will be used"
  type        = string
  default     = ""
}

variable "allow_major_version_upgrade" {
  description = "Indicates that major version upgrades are allowed. Changing this parameter does not result in an outage and the change is asynchronously applied as soon as possible"
  type        = bool
  default     = false
}

variable "storage_type" {
  description = "Storage type for the rds instance"
  type        = string
}

variable "multi_az" {
  description = "Multi-AZ deployment"
  type        = bool
}

variable "name_subnet_group" {
  description = "Creates a unique name for the db_subnet_group"
  type        = string
}

variable "deletion_protection" {
  description = "Protects the database from being deleted accidentally. While this option is enabled, you can’t delete the database."
  type        = string
}

variable "create" {
  description = "Whether to create this resource or not?"
  type        = bool
  default     = false
}

variable "port" {
  description = "TCP/IP port that the database will use for application connections."
  type        = number
}


variable "backup_retention_period" {
  description = "Choose the number of days that RDS should retain automatic backups for this instance."
  type        = number
}

variable "monitoring_interval" {
  description = ""
  type        = number
}

variable "auto_minor_version_upgrade" {
  description = ""
  type        = bool
  default     = true
}

variable "iops" {
  description = "The amount of provisioned IOPS. Setting this implies a storage_type of 'io1'"
  type        = number
  default     = 0
}

variable "copy_tags_to_snapshot" {
  description = "On delete, copy all Instance tags to the final snapshot (if final_snapshot_identifier is specified)"
  type        = bool
  default     = false
}

variable "skip_final_snapshot" {
  description = "Determines whether a final DB snapshot is created before the DB instance is deleted. If true is specified, no DBSnapshot is created. If false is specified, a DB snapshot is created before the DB instance is deleted, using the value from final_snapshot_identifier"
  type        = bool
  default     = true
}

variable "final_snapshot_identifier" {
  description = "The name of your final DB snapshot when this DB instance is deleted."
  type        = string
  default     = null
}

variable "backup_window" {
  description = "Backup window for RDS instance"
  type        = string
  default     = "03:00-06:00"
}

variable "maintenance_window" {
  description = "Maintenance window for RDS instance"
  type        = string
}

variable "aws_security_group_name" {
  description = "Security group in which the RDS is to be provisioned"
  type        = string
}

variable "publicly_accessible" {
  description = "Bool to control if instance is publicly accessible"
  type        = bool
  default     = false
}

variable "db_subnet_group_role" {
  description = "Role tag to be added to db subnet group"
  type        = string
}

variable "db_instance_role" {
  description = "Role Tag to be added to db instance "
  type        = string
}

variable "monitoring_role_name" {
  description = "Name of the IAM role which will be created when create_monitoring_role is enabled."
  type        = string
}

#DB Parameter Group
variable "create_db_parameter_group" {}

variable "name_parameter_group" {}

variable "db_parameter_role" {}

variable "family" {}

# DB Subnet Group
variable "create_subnet" {
  description = " Whether to create a subnet group or not"
  type        = bool
  default     = true
}

# Db options group
variable "create_db_option_group" {
  description = "Whether to create this option group or not. We can also use existing options group for the Database"
  type        = bool
  default     = false
}

variable "name_db_option_group" {
  description = "The name of the option group. If omitted, Terraform will assign a random, unique name. Must be lowercase, to match as it is stored in AWS."
  type        = string
}

variable "option_group_description" {
  description = "The description of the option group."
  type        = string
}

variable "major_engine_version" {
  description = "Specifies the major version of the engine that this option group should be associated with."

}

variable "db_option_group_role" {
  description = "Specifies the role associated with this option group"
  type        = string
}
