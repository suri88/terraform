###############################################################################
# VPC Configuration
###############################################################################

security_group_name                    = "par-cicd-poc-test-sg-001"
security_group_description             = "test description"
security_group_role                    = "test role"
region                                 = "eu-west-3"

upsa_account_tags = {
  dept       = "testing"

}

vpc_id      = "vpc-00073ae4160bbea68"

ingress_with_cidr_blocks = [
  {
    rule        = "https-443-tcp"
    cidr_blocks = "10.0.7.0/24"
  },
  {
    from_port   = 10
    to_port     = 20
    protocol    = 6
    description = "Service name"
    cidr_blocks = "10.10.3.0/24"
  },
  {
    from_port   = 100
    to_port     = 200
    protocol    = 6
    description = "Service name"
    cidr_blocks = "10.10.1.0/24,10.10.2.0/24"
  },
]

# Open for security group id (rule or from_port+to_port+protocol+description)
ingress_with_source_security_group_id = [
  {
    rule                     = "http-80-tcp"
    source_security_group_id = "sg-06be0e6c195ccd425"
  },
  {
    from_port                = 10
    to_port                  = 10
    protocol                 = 6
    description              = "Service name"
    source_security_group_id = "sg-06be0e6c195ccd425"
  },
  {
    from_port                = 100
    to_port                  = 100
    protocol                 = 10
    description              = "Service name"
    source_security_group_id = "sg-06be0e6c195ccd425"
  },
]

# Open for self (rule or from_port+to_port+protocol+description)
ingress_with_self = [
  {
    rule = "all-all"
  },
  {
    from_port   = 30
    to_port     = 40
    protocol    = 6
    description = "Service name"
    self        = true
  },
  {
    from_port = 41
    to_port   = 51
    protocol  = 6
    description = "Service name"
    self      = true
  },
]

# Default CIDR blocks, which will be used for all egress rules in this module. Typically these are CIDR blocks of the VPC.
# If this is not specified then no CIDR blocks will be used.
egress_cidr_blocks = ["10.10.0.0/16"]
egress_rules = ["http-80-tcp"]

# Open to CIDRs blocks (rule or from_port+to_port+protocol+description)
egress_with_cidr_blocks = [
  {
    rule        = "https-443-tcp"
    cidr_blocks = "30.30.30.30/32"
  },
  {
    from_port   = 10
    to_port     = 20
    protocol    = 6
    description = "Service name"
    cidr_blocks = "10.10.3.0/24"
  },
  {
    from_port   = 10
    to_port     = 20
    protocol    = 6
    description = "Service name"
    cidr_blocks = "10.10.1.0/24,10.10.2.0/24"
  },
]

# Open for security group id (rule or from_port+to_port+protocol+description)
egress_with_source_security_group_id = [
  {
    rule                     = "mysql-tcp"
    source_security_group_id = "sg-06be0e6c195ccd425"
  },
  {
    from_port                = 10
    to_port                  = 10
    protocol                 = 6
    description              = "Service name"
    source_security_group_id = "sg-06be0e6c195ccd425"
  },
  {
    from_port                = 100
    to_port                  = 100
    protocol                 = 6
    description              = "Service name"
    source_security_group_id = "sg-06be0e6c195ccd425"
  },
]


# Open for self (rule or from_port+to_port+protocol+description)
egress_with_self = [
  {
    rule = "all-all"
  },
  {
    from_port   = 30
    to_port     = 40
    protocol    = "tcp"
    description = "Service name"
    self        = true
  },
  {
    from_port = 41
    to_port   = 51
    protocol  = 6
    self      = true
  },
]
