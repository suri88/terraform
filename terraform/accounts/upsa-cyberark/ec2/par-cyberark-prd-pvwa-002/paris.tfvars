region                        = "eu-west-3"

key_name                      =  "upsa_cyberark_prd_paris"

ami                           = "ami-021a0fd302ca6dea2"

aws_instance_name             = "par-cyberark-prd-pvwa-002"

instance_role                 = "PVWA"

vpc_id                        = "vpc-0719bdfe2bba83593"

subnet_id                     = "subnet-086d3f6e3f223be74"

private_ip                    = "10.0.7.165"

security_group_ids           = ["sg-0573426c19368a72a"]

instance_type                 = "t3.large"

root_block_device = [
    {
      volume_type = "gp2"
      volume_size = 300
      encrypted   = true
    },
  ]

  ebs_block_device = [
    {
      device_name = "xvdb"
      volume_type = "gp2"
      volume_size = 100
      encrypted   = true

    },

  ]
