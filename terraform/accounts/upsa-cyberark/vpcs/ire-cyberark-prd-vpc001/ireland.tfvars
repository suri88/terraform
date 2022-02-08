region = "eu-west-1"

###############################################################################
# VPC Configuration
###############################################################################

create_vpc                    = true

# VPC CIDR
vpc_cidr_block                = "10.2.7.0/24"

vpc_name                      = "ire-cyberark-prd-vpc001"

vpc_role                      = "Cyberark Prd DR VPC attachment"

destination_cidr_block        = "0.0.0.0/0"

###############################################################################
# Application  Subnets
###############################################################################

# Creates a tag with key of 'Name' and a value that you specify
app_subnet_name           = "app"

app_subnet_role           = "ingress"

app_route_table_role      = "Private Application Route Table"

app_network_acl_name      = "app"

app_network_acl_role      = "Cyberark Applications Ingress Access Control List"

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

web_subnet_role           = "ingress"

web_route_table_role      = "Private Application Route Table"

web_network_acl_name      = "web"

web_network_acl_role      = "Cyberark Web Ingress Access Control List"

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

dbs_subnet_role           = "ingress"

dbs_route_table_role      = "Private Database Route Table"

dbs_network_acl_name      = "dbs"

dbs_network_acl_role      = "Cyberark Database Ingress Access Control List"

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
security_group_name           = "ire-cyberark-prd-dr-vpc001-attachment-sg001"

security_group_role           = "UPSA Network Local Access"

ingress_ports                 = [ 0 ]

security_group_cidr_block     = "10.2.0.0/24"

security_group_description    = "Default Security Group to Allow Local Access to the UPSA Network"

dynamic_ingress_description   = "UPSA-NETWORK"

##########################################################################################
#Transit gateway parameters
##########################################################################################


transit_gateway_id = "tgw-013453c3059f98696"

s3_bucket = "upsa.eu.west.1.cyberark.terraform-remote-state"
s3_vpc_key   = "upsa-cyberark/vpcs/ire-cyberark-prd-vpc001/terraform.tfstate"

create_internet_route = "true"
destination_cidr_block_ntw = "10.2.0.0/24"

transit_gateway_default_route_table_association = false
transit_gateway_default_route_table_propagation = false

route_table_id_egress = "rtb-026c5cee4ca2c6833"
create_internet_route_egress = "false"
destination_cidr_block_vpc = "10.2.7.0/24"

ram_resource_name = "ire-upsa-network-tgw001-cyberark-001"
transit_gateway_arn = "arn:aws:ec2:eu-west-1:707783183724:transit-gateway/tgw-013453c3059f98696"
account_number = "734839700165"

tgw_attachment_name = "ire-cyberark-prd-attach001"
transit_gateway_route_table_id = "tgw-rtb-06f444736c302f7c3"


#########################################################################################
# Global tags to be applied to all AWS resources created in sharedservices
#########################################################################################
upsa_account_tags = {
    BusinessOwner       = "Upsa-Automation"
    BusinessUnit        = "prd-dr"
    CostCentre          = "Not Applicable"
    DataCentre          = "Ireland"
    Email               = "upsa-automation@wipro.com"
    Project             = "IaC"
    ProvisioningTool    = "Terraform"
}
