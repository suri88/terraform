region                        = "eu-west-3"

key_name                      =  "upsa_cyberark_prd_paris"

ami                           = "ami-04c6013c2a18867c6"

aws_instance_name             = "par-cyberark-prd-cpm-001"

instance_role                 = "CPM"

vpc_id                        = "vpc-0719bdfe2bba83593"

subnet_id                     = "subnet-0e256e889bfb08042"

private_ip                    = "10.0.7.36"

security_group_ids           = ["sg-0616018bebbdbc0fc"]

instance_type                 = "c5.xlarge"

root_block_device = [
    {
      volume_type = "gp2"
      volume_size = 500
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
