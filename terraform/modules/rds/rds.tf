# Db Subnet group
resource "aws_db_subnet_group" "this" {
  count       = var.create_subnet ? 1 : 0
  name        = var.name_subnet_group
  description = "Database subnet group for ${var.identifier}"
  subnet_ids  = var.subnet_ids
  tags        = merge(var.db_subnet_group_tags, map("Name", format("%s", var.name_subnet_group), "Role", var.db_subnet_group_role))
}

# Db Option_Group
resource "aws_db_option_group" "this" {
  count                    = var.create_db_option_group ? 1 : 0
  name                     = var.name_db_option_group
  option_group_description = var.option_group_description == "" ? format("Option group for %s", var.identifier) : var.option_group_description
  engine_name              = var.engine
  major_engine_version     = var.major_engine_version
  tags                     = merge(var.options_group_tags, map("Name", format("%s", var.name_db_option_group), "Role", var.db_option_group_role))
}

# Db Parameter Group
locals {
  description = "Database parameter group for ${var.identifier}"
}

resource "aws_db_parameter_group" "this" {
  count       = var.create_db_parameter_group ? 1 : 0
  name        = var.name_parameter_group
  description = local.description
  family      = var.family
  tags        = merge(var.db_parameter_group_tags, map("Name", format("%s", var.name_parameter_group), "Role", var.db_parameter_role))

}


# Db instance
locals {
  is_mssql = element(split("-", var.engine), 0) == "sqlserver"
}


resource "aws_db_instance" "this_mssql" {
  depends_on                  = [aws_db_subnet_group.this, aws_db_parameter_group.this, aws_db_option_group.this]
  count                       = var.create && local.is_mssql ? 1 : 0
  identifier                  = var.identifier
  engine                      = var.engine
  engine_version              = var.engine_version
  instance_class              = var.instance_class
  allocated_storage           = var.allocated_storage
  storage_type                = var.storage_type
  storage_encrypted           = var.storage_encrypted
  license_model               = var.license_model
  name                        = var.name
  username                    = var.username
  password                    = var.password
  port                        = var.port
  vpc_security_group_ids      = var.vpc_security_group_ids
  db_subnet_group_name        = var.name_subnet_group
  parameter_group_name        = var.name_parameter_group
  multi_az                    = var.multi_az
  backup_retention_period     = var.backup_retention_period
  deletion_protection         = var.deletion_protection
  tags                        = merge(var.db_instance_tags, map("Name", format("%s", var.identifier), "Role", var.db_instance_role))
  option_group_name           = var.name_db_option_group
  monitoring_interval         = var.monitoring_interval
  monitoring_role_arn         = var.monitoring_interval > 0 ? coalesce(var.monitoring_role_arn, var.iam_role_arn, null) : null
  allow_major_version_upgrade = var.allow_major_version_upgrade
  auto_minor_version_upgrade  = var.auto_minor_version_upgrade
  iops                        = var.iops
  publicly_accessible         = var.publicly_accessible
  maintenance_window          = var.maintenance_window
  skip_final_snapshot         = var.skip_final_snapshot
  copy_tags_to_snapshot       = var.copy_tags_to_snapshot
  final_snapshot_identifier   = var.final_snapshot_identifier
  kms_key_id                  = var.kms_key_id
  backup_window               = var.backup_window
}






