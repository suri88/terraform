##### Fixed parameters ###################
##########################################
publicly_accessible = false

allow_major_version_upgrade = false

auto_minor_version_upgrade = true

backup_window = "01:00-06:00"

copy_tags_to_snapshot = true

maintenance_window = "Sun:22:00-Mon:00:00"

engine = "sqlserver-se"

engine_version = "14.00.3281.6.v1"



########## Resources to be created #############
################################################
create_db_parameter_group = true # create parameter groups

create = true # to created rds instance

create_subnet = true # create subnets

create_db_option_group = true

##############################################################

###########Subnet Group Details###############################
#############################################################
name_subnet_group = "par-cicd-dev-poc-rds"

db_subnet_group_role = "Db-Subnet-group"


#############RDS Instance #######################################
#################################################################

vpc_id = "vpc-00073ae4160bbea68"

identifier = "par-cicd-dev-poc-rds-001" #rds identifier Name

instance_class = "db.m5.large"

allocated_storage = 20

storage_encrypted = false

db_instance_role = "POC RDS Database"

kms_key_id = "" # This will take the default kms_key_id.

username = "admin"

#password = "Paris-123"

storage_type = "gp2"

iops = 0

# To enable Multi-AZ, we need to make sure that backup_retention_period is not set to 0
# For Multi-AZ only Standard and Enterprise Engine for database to be used.
# Also verify the instance type supported for Multi-AZ.
multi_az = false

#to be kept 'True' in case of Prod DB
deletion_protection = false

port = "1433"

backup_retention_period = 0

skip_final_snapshot = true

final_snapshot_identifier = "par-cicd-dev-poc-rds-snapshot"

aws_security_group_name = "par-cicd-dev-poc-local-access-vpc002-sg001"

monitoring_interval = 0

monitoring_role_name = "rds-monitoring-role"

################ Db Parameter Group ###################
#######################################################

name_parameter_group = "sqlserver-se-14"

db_parameter_role = "sqlserver-se-14.0 Parameter Group"

family = "sqlserver-se-14.0"

############ DB Options Group Inputs#################
#####################################################
name_db_option_group = "sql-server-standard-option-group"

major_engine_version = "14.00"

option_group_description = "Option Group created for sqlserver Express Edition"

db_option_group_role = "POC RDS Option Group"

###########################################################
