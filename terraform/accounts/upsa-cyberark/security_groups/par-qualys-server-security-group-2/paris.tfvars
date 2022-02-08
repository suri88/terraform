###############################################################################
# VPC Configuration
###############################################################################

security_group_name                    = "par-qualys-server-security-group-2"
security_group_description             = "Security group for Qualys Scanner"
security_group_role                    = "Qualys Scanner"
region                                 = "eu-west-3"

upsa_account_tags = {
  dept       = "production"

}

vpc_id      = "vpc-0719bdfe2bba83593"

ingress_with_cidr_blocks = [
  {
    from_port   = 21
    to_port     = 23
    protocol    = 6
    description = "SSH,FTP"
    cidr_blocks = "10.0.0.9/32"
  },
  {
    from_port   = 25
    to_port     = 25
    protocol    = 6
    cidr_blocks = "10.0.0.9/32"
  },
  {
    from_port   = 53
    to_port     = 53
    protocol    = 6
    cidr_blocks = "10.0.0.9/32"
  },
  {
    from_port   = 80
    to_port     = 80
    protocol    = 6
    cidr_blocks = "10.0.0.9/32"
  },
  {
    from_port   = 88
    to_port     = 88
    protocol    = 6
    cidr_blocks = "10.0.0.9/32"
  },
  {
    from_port   = 110
    to_port     = 111
    protocol    = 6
    description = "Service name"
    cidr_blocks = "10.0.0.9/32"
  },
  {
    from_port   = 135
    to_port     = 135
    protocol    = 6
    cidr_blocks = "10.0.0.9/32"
  },
  {
    from_port   = 137
    to_port     = 137
    protocol    = 6
    cidr_blocks = "10.0.0.9/32"
  },
  {
    from_port   = 139
    to_port     = 139
    protocol    = 6
    cidr_blocks = "10.0.0.9/32"
  },
  {
    from_port   = 161
    to_port     = 161
    protocol    = 6
    cidr_blocks = "10.0.0.9/32"
  },
  {
    from_port   = 500
    to_port     = 500
    protocol    = 6
    cidr_blocks = "10.0.0.9/32"
  },
  {
    rule        = "https-443-tcp"
    cidr_blocks = "10.0.0.9/32"
  },
  {
    from_port   = 445
    to_port     = 445
    protocol    = 6
    cidr_blocks = "10.0.0.9/32"
  },
]

# Default CIDR blocks, which will be used for all egress rules in this module. Typically these are CIDR blocks of the VPC.
# If this is not specified then no CIDR blocks will be used.

# Open for cidr_blocks (rule or from_port+to_port+protocol+description)
egress_with_cidr_blocks = [
  {
    from_port   = 21
    to_port     = 23
    protocol    = 6
    description = "SSH,FTP"
    cidr_blocks = "10.0.0.9/32"
  },
  {
    from_port   = 25
    to_port     = 25
    protocol    = 6
    cidr_blocks = "10.0.0.9/32"
  },
  {
    from_port   = 53
    to_port     = 53
    protocol    = 6
    cidr_blocks = "10.0.0.9/32"
  },
  {
    from_port   = 80
    to_port     = 80
    protocol    = 6
    cidr_blocks = "10.0.0.9/32"
  },
  {
    from_port   = 88
    to_port     = 88
    protocol    = 6
    cidr_blocks = "10.0.0.9/32"
  },
  {
    from_port   = 110
    to_port     = 111
    protocol    = 6
    description = "Service name"
    cidr_blocks = "10.0.0.9/32"
  },
  {
    from_port   = 135
    to_port     = 135
    protocol    = 6
    cidr_blocks = "10.0.0.9/32"
  },
  {
    from_port   = 137
    to_port     = 137
    protocol    = 6
    cidr_blocks = "10.0.0.9/32"
  },
  {
    from_port   = 139
    to_port     = 139
    protocol    = 6
    cidr_blocks = "10.0.0.9/32"
  },
  {
    from_port   = 161
    to_port     = 161
    protocol    = 6
    cidr_blocks = "10.0.0.9/32"
  },
  {
    from_port   = 500
    to_port     = 500
    protocol    = 6
    cidr_blocks = "10.0.0.9/32"
  },
  {
    rule        = "https-443-tcp"
    cidr_blocks = "10.0.0.9/32"
  },
  {
    from_port   = 445
    to_port     = 445
    protocol    = 6
    cidr_blocks = "10.0.0.9/32"
  },
]
