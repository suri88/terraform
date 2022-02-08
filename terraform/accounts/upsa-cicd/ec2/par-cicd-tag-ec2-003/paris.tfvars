region                        = "eu-west-3"

key_name                      =  "upsa_cicd_dev_paris"

ami                           = "ami-0e0f1b9798f22e201"

aws_instance_name             = "vm_name"

instance_role                 = "POC"

vpc_id                        = "vpc-00073ae4160bbea68"

//subnet_id                     = "subnet-07f5af903b7ea0e26"

//private_ip                    = "10.0.99.26"

associate_public_ip_address     = false

security_group_ids           = ["sg-0c551381019b2a6d9"]

subnet_num                   = 1

subnet_type                  = "s_type"

instance_count               = inst_count

instance_type                = "t2.micro"

root_block_device = [
    {
      volume_type = "gp2"
      volume_size = 30
      encrypted   = true
    },
  ]

  ebs_block_device = [
    {
      device_name = "xvdb"
      volume_type = "gp2"
      volume_size = 50
      encrypted   = true

    },

  ]
