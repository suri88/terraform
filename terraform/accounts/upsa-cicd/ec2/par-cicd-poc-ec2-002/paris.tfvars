region                          = "eu-west-3"

#vpc_cidr_block                  = "10.0.99.0/24"

#ami                          = "ami-094d3ba293b021a49" 

key_name                      =  "upsa_cicd_dev_paris"

ami                           = "ami-0e0f1b9798f22e201"

aws_instance_name             = "par-cicd-poc-ec2-002"

instance_role                 = "POC"

vpc_id                        = "vpc-00073ae4160bbea68"

destination_cidr_block        = "0.0.0.0/0"

private_ip                    = "10.0.99.135"

security_group_name           = "par-cicd-poc-ec2-sg-001"

security_group_role           = "UPSA-cicd-ec2"

ingress_ports                 = [ 0 ]

subnet_num 		                = 0

security_group_cidr_block     = "10.0.0.0/24"

security_group_description    = "Default Security Group to Allow Local Access to the UPSA Network"

dynamic_ingress_description   = "UPSA-NETWORK"

instance_type                 = "t2.micro"

root_block_device = [
    {
      volume_type = "gp2"
      volume_size = 30
    },
  ]

  ebs_block_device = [
    {
      device_name = "/dev/sdf"
      volume_type = "gp2"
      volume_size = 40
      encrypted   = true

    },
    /*{
      device_name = "/dev/xvdc"
      volume_type = "gp2"
      volume_size = 50
      encrypted   = true
    },
    {
      device_name = "/dev/xvdb"
      volume_type = "gp2"
      volume_size = 50
      encrypted   = true
	  }*/
  ]
