region                        = "eu-west-3"

key_name                      =  "upsa_cyberark_prd_paris"

ami                           = "ami-0fbe4619e77485357"

aws_instance_name             = "par-cyberark-prd-vault-new-002"

instance_role                 = "vault-dr"

vpc_id                        = "vpc-0c12c3160289595a0"

subnet_id                     = "subnet-0f415a5793f703e3c"

private_ip                    = "10.0.8.197"

security_group_ids           = ["sg-0484963ff085b3bb6"]

instance_type                 = "m5.xlarge"

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
