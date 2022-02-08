region = "eu-west-3"

###############################################################################
# VPC Configuration
###############################################################################

create_vpc                    = true

# VPC CIDR
vpc_cidr_block                = "10.0.95.0/24"

vpc_name                      = "par-cicd-dev-poc-vpc005"

vpc_role                      = "Test POC for VPC attachments"

destination_cidr_block        = "0.0.0.0/0"

###############################################################################
# Application  Subnets
###############################################################################

# Creates a tag with key of 'Name' and a value that you specify
app_subnet_name           = "app"

app_subnet_role           = "ingress"

app_route_table_role      = "Private Application Route Table"

app_network_acl_name      = "app"

app_network_acl_role      = "Test POC Applications Ingress Access Control List"

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

web_network_acl_role      = "Test POC Web Ingress Access Control List"

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

dbs_network_acl_role      = "Test POC Database Ingress Access Control List"

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
security_group_name           = "par-cicd-dev-poc-local-access-vpc005-attachment-sg001"

security_group_role           = "UPSA Network Local Access"

ingress_ports                 = [ 0 ]

security_group_cidr_block     = "10.0.0.0/24"

security_group_description    = "Default Security Group to Allow Local Access to the UPSA Network"

dynamic_ingress_description   = "UPSA-NETWORK"

##########################################################################################
#Transit gateway parameters
##########################################################################################


transit_gateway_id = "tgw-091f7791b5b901a88"

s3_bucket = "upsa.eu.west.3.cicd.terraform-remote-state"
s3_vpc_key   = "upsa-cicd/vpcs/par-cicd-dev-poc-vpc005-code/terraform.tfstate"

create_internet_route = "true"
destination_cidr_block_ntw = "10.0.0.0/24"

transit_gateway_default_route_table_association = false
transit_gateway_default_route_table_propagation = false

route_table_id_egress = "rtb-0503196bb580ee998"
create_internet_route_egress = "false"
destination_cidr_block_vpc = "10.0.95.0/24"

ram_resource_name = "par-upsa-network-tgw001-cicd-poc3"
transit_gateway_arn = "arn:aws:ec2:eu-west-3:707783183724:transit-gateway/tgw-091f7791b5b901a88"
account_number = "762127463824"

tgw_attachment_name = "par-cicd-poc3-dev-attach"
transit_gateway_route_table_id = "tgw-rtb-07989faa22fc2bb3e"


#########################################################################################
# Global tags to be applied to all AWS resources created in CI-CD
#########################################################################################
upsa_account_tags = {
    BusinessOwner       = "Upsa-Automation"
    BusinessUnit        = "dev"
    CostCentre          = "Not Applicable"
    DataCentre          = "Paris"
    Email               = "upsa-automation@wipro.com"
    Project             = "IaC"
    ProvisioningTool    = "Terraform"
}
