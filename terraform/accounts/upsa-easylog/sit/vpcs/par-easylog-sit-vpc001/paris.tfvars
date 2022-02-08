###############################################################################
# VPC Configuration
###############################################################################

create_vpc                    = true

# VPC CIDR
vpc_cidr_block                = "10.0.12.0/24"

vpc_name                      = "par-easylog-sit-vpc001"

vpc_role                      = "EasyLog-Sit"

destination_cidr_block        = "0.0.0.0/0"

###############################################################################
# Application  Subnets
###############################################################################

# Creates a tag with key of 'Name' and a value that you specify
app_subnet_name               = "app"

app_subnet_role               = "app"

app_route_table_role          = "Private Application Route Table"

app_network_acl_name          = "app"

app_network_acl_role          = "EasyLog-Sit Applications Ingress Access Control List"

# Number of subnets required
app_subnets                   = 3

# Web CIDR block required
app_newbit_size               = 3

# This is a limitation in Terraform cidr function we need to specify where to
# start to avoid overlapping errors
app_subnet_start              = 0

###############################################################################
# Web  Subnets
###############################################################################

# Creates a tag with key of 'Name' and a value that you specify
web_subnet_name               = "web"

web_subnet_role               = "web"

web_route_table_role          = "Private Application Route Table"

web_network_acl_name          = "web"

web_network_acl_role          = "EasyLog-Sit Web Ingress Access Control List"

# Number of subnets required
web_subnets                   = 3

# Web CIDR block required
web_newbit_size               = 3

# This is a limitation in Terraform cidr function we need to specify where to
# start to avoid overlapping errors
web_subnet_start              = 3

###############################################################################
# Web  Subnets
###############################################################################

# Creates a tag with key of 'Name' and a value that you specify
dbs_subnet_name               = "dbs"

dbs_subnet_role               = "dbs"

dbs_route_table_role          = "Private Database Route Table"

dbs_network_acl_name          = "dbs"

dbs_network_acl_role          = "EasyLog-Sit Database Ingress Access Control List"

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
security_group_name           = "par-easylog-sit-local-access-vpc001-sg001"

security_group_role           = "UPSA Network Local Access"

ingress_ports                 = [ 0 ]

security_group_cidr_block     = "10.0.0.0/24"

security_group_description    = "Default Security Group to Allow Local Access to the UPSA Network"

dynamic_ingress_description   = "UPSA-NETWORK"
