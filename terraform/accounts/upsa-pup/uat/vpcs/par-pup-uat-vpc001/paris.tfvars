###############################################################################
# VPC Configuration
###############################################################################

create_vpc                    = true

# VPC CIDR
vpc_cidr_block                = "10.0.25.0/24"

vpc_name                      = "par-pup-uat-vpc001"

vpc_role                      = "Pup UAT"

destination_cidr_block        = "0.0.0.0/0"

###############################################################################
# Application  Subnets
###############################################################################

# Creates a tag with key of 'Name' and a value that you specify
app_subnet_name           = "app"

app_subnet_role           = "app"

app_route_table_role      = "Private Application Route Table"

app_network_acl_name      = "app"

app_network_acl_role      = "PUP UAT Applications Ingress Access Control List"

# Number of subnets required
app_subnets               = 3

# Web CIDR block required
app_newbit_size           = 3

# This is a limitation in Terraform cidr function we need to specify where to
# start to avoid overlapping errors
app_subnet_start          = 0

###############################################################################
# Web  Subnets
###############################################################################

# Creates a tag with key of 'Name' and a value that you specify
web_subnet_name           = "web"

web_subnet_role           = "web"

web_route_table_role      = "Private Application Route Table"

web_network_acl_name      = "web"

web_network_acl_role      = "PUP UAT Web Ingress Access Control List"

# Number of subnets required
web_subnets               = 3

# Web CIDR block required
web_newbit_size           = 3

# This is a limitation in Terraform cidr function we need to specify where to
# start to avoid overlapping errors
web_subnet_start          = 3

###############################################################################
# Web  Subnets
###############################################################################

# Creates a tag with key of 'Name' and a value that you specify
dbs_subnet_name           = "dbs"

dbs_subnet_role           = "dbs"

dbs_route_table_role      = "Private Database Route Table"

dbs_network_acl_name      = "dbs"

dbs_network_acl_role      = "PUP UAT Database Ingress Access Control List"

# Number of subnets required
dbs_subnets               = 3

# Web CIDR block required
dbs_newbit_size           = 4

# This is a limitation in Terraform cidr function we need to specify where to
# start to avoid overlapping errors
dbs_subnet_start          = 12

###############################################################################
# Default Security  Group - UPSA-Network
# This security group should be created in all accounts
###############################################################################

# Creates a tag with key of 'Name' and a value that you specify
security_group_name           = "par-pup-uat-local-access-vpc001-attachment-sg001"

security_group_role           = "UPSA Network Local Access"

ingress_ports                 = [ 0 ]

security_group_cidr_block     = "10.0.0.0/24"

security_group_description    = "Default Security Group to Allow Local Access to the UPSA Network"

dynamic_ingress_description   = "UPSA-NETWORK"

##########################################################################################
#Transit gateway parameters
##########################################################################################


transit_gateway_id = "tgw-091f7791b5b901a88"
tgw_attachment_name = "par-pup-uat-vpc001-attach"
transit_gateway_route_table_id = "tgw-rtb-07989faa22fc2bb3e"

s3_bucket = "upsa.eu.west.3.pup-uat.terraform-remote-state"
s3_vpc_key   = "upsa-pup/uat/vpcs/par-pup-uat-vpc001/terraform.tfstate"

create_internet_route = "true"
destination_cidr_block_ntw = "10.0.0.0/24"

transit_gateway_default_route_table_association = false
transit_gateway_default_route_table_propagation = false

route_table_id_egress = "rtb-0503196bb580ee998"
create_internet_route_egress = "false"
destination_cidr_block_vpc = "10.0.25.0/24"

ram_resource_name = "par-upsa-network-tgw001-pup-uat"
transit_gateway_arn = "arn:aws:ec2:eu-west-3:707783183724:transit-gateway/tgw-091f7791b5b901a88"
account_number = "595525503433"


#########################################################################################
# Global tags to be applied to all AWS resources created in pup sit
#########################################################################################
upsa_account_tags = {
    BusinessOwner       = "Paul Canourgues"
    BusinessUnit        = "IT"
    CostCentre          = "9020135"
    DataCentre          = "Paris"
    Email               = "upsa-automation@wipro.com"
    Project             = "PUP"
    ProvisioningTool    = "Terraform"
}
