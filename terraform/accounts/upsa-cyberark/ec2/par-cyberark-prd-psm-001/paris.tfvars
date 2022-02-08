region                        = "eu-west-3"

key_name                      =  "upsa_cyberark_prd_paris"

ami                           = "ami-0b8b10f04a9bb5a3e"

aws_instance_name             = "par-cyberark-prd-psm-001"

instance_role                 = "PSM"

vpc_id                        = "vpc-0719bdfe2bba83593"

subnet_id                     = "subnet-0e256e889bfb08042"

private_ip                    = "10.0.7.37"

security_group_ids           = ["sg-0d128a73c06182845"]

instance_type                 = "m5.4xlarge"

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
