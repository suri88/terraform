###############################################################################
# VPC Configuration
###############################################################################

create_vpc                    = true

# VPC CIDR
vpc_cidr_block                = "10.0.8.0/24"

vpc_name                      = "par-cyberark-prd-vpc002"

vpc_role                      = "Cyberark prd"

destination_cidr_block        = "0.0.0.0/0"


###############################################################################
# Web  Subnets
###############################################################################

# Creates a tag with key of 'Name' and a value that you specify
dbs_subnet_name               = "dbs"

dbs_subnet_role               = "database"

dbs_route_table_role          = "Private Database Route Table"

dbs_network_acl_name          = "dbs"

dbs_network_acl_role          = "cyberark Database Ingress Access Control List"

# Number of subnets required
dbs_subnets                   = 3

# Web CIDR block required
dbs_newbit_size               = 4

# This is a limitation in Terraform cidr function we need to specify where to
# start to avoid overlapping errors
dbs_subnet_start              = 12

###############################################################################
# Default Security  Group - UPSA-Network
# This security group should be created in all accounts
###############################################################################

# Creates a tag with key of 'Name' and a value that you specify
security_group_name           = "par-cyberark-local-access-vpc002-sg001"

security_group_role           = "UPSA Network Local Access"

ingress_ports                 = [ 0 ]

security_group_cidr_block     = "10.0.0.0/24"

security_group_description    = "Default Security Group to Allow Local Access to the UPSA Network"

dynamic_ingress_description   = "UPSA-NETWORK"
