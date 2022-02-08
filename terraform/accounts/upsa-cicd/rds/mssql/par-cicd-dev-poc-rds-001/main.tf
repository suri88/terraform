provider "aws" {
  region  = var.region
  version = "~> 2.66"
}
##############################################################
# Data sources to get VPC, subnets and security group details
##############################################################

data "aws_vpc" "selected" {
  id = var.vpc_id
}


data "aws_subnet_ids" "selected" {
  vpc_id = data.aws_vpc.selected.id

  filter {
    name   = "tag:Role"
    values = ["database"]
  }
}


data "aws_security_group" "selected" {
  vpc_id = data.aws_vpc.selected.id
  name   = var.aws_security_group_name
}

data "aws_iam_role" "enhanced_monitoring" {
  name = var.monitoring_role_name
}

## DB

module "db" {
  source        = "../../../../../modules/rds"
  create        = var.create
  create_subnet = var.create_subnet
  #create_monitoring_role      = var.create_monitoring_role
  identifier                  = var.identifier
  engine                      = var.engine
  engine_version              = var.engine_version
  instance_class              = var.instance_class
  allocated_storage           = var.allocated_storage
  storage_type                = var.storage_type
  iops                        = var.iops
  storage_encrypted           = var.storage_encrypted
  multi_az                    = var.multi_az
  name_subnet_group           = var.name_subnet_group
  db_subnet_group_role        = var.db_subnet_group_role
  db_instance_role            = var.db_instance_role
  db_parameter_role           = var.db_parameter_role
  family                      = var.family
  monitoring_interval         = var.monitoring_interval
  name_parameter_group        = var.name_parameter_group
  monitoring_role_name        = data.aws_iam_role.enhanced_monitoring.name
  iam_role_arn                = data.aws_iam_role.enhanced_monitoring.arn
  allow_major_version_upgrade = var.allow_major_version_upgrade
  auto_minor_version_upgrade  = var.auto_minor_version_upgrade
  name                        = null #identifier
  kms_key_id                  = var.kms_key_id
  username                    = var.username
  password                    = random_password.password.result
  port                        = var.port
  subnet_ids                  = data.aws_subnet_ids.selected.ids
  publicly_accessible         = var.publicly_accessible
  vpc_security_group_ids      = [data.aws_security_group.selected.id]
  db_subnet_group_tags        = module.upsa-tags.upsa_aws_cicd_dev_env_default_tags
  db_instance_tags = merge(module.upsa-tags.upsa_aws_cicd_dev_env_default_tags, map(
    "Name", format("%s", var.identifier),
    "Role", var.db_instance_role
    )
  )

  db_parameter_group_tags = merge(module.upsa-tags.upsa_aws_cicd_dev_env_default_tags, map("Name", format("%s", var.name_parameter_group),
  "Role", var.db_parameter_role))

  # disable backups to create DB faster
  backup_retention_period = var.backup_retention_period
  backup_window           = var.backup_window
  maintenance_window      = var.maintenance_window
  copy_tags_to_snapshot   = var.copy_tags_to_snapshot

  # Snapshot name upon DB deletion
  skip_final_snapshot       = var.skip_final_snapshot
  final_snapshot_identifier = var.final_snapshot_identifier

  create_db_parameter_group = var.create_db_parameter_group

  license_model = "license-included"

  # Database Deletion Protection
  deletion_protection = var.deletion_protection

  # DB options
  create_db_option_group   = var.create_db_option_group
  name_db_option_group     = var.name_db_option_group
  major_engine_version     = var.major_engine_version
  option_group_description = var.option_group_description
  db_option_group_role     = var.db_option_group_role
  options_group_tags = merge(module.upsa-tags.upsa_aws_cicd_dev_env_default_tags, map("Name", format("%s", var.name_db_option_group),
  "Role", var.db_option_group_role))

}

###############################################################################
# UPSA Global Tagging Module
###############################################################################

module upsa-tags {
  source = "../../../../../modules/upsa-tags"

}


module "aws_ssm_parameter" {
  source = "../../../../../modules/parameterstore"
  parameter_write = [
    {
      name        = "/database/${var.identifier}/password"
      description = "The Password for the RDS instance generated"
      type        = "SecureString"
      value       = random_password.password.result
    }
  ]
}

## Random Password generation
resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "_%@"
}





