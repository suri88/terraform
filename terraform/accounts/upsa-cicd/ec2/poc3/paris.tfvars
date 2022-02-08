region                          = "eu-west-3"

#vpc_cidr_block                  = "10.0.99.0/24"

ami                          = "ami-0e0f1b9798f22e201"

key_name                      =  "upsa_cicd_dev_paris"

#ami                           = "ami-0e0f1b9798f22e201"

aws_instance_name             = "test-ec2-poc-state"

#aws_instance_name             = "test-ec2-poc"

instance_role                 = "POC"

vpc_id                        = "vpc-00073ae4160bbea68"

destination_cidr_block        = "0.0.0.0/0"

private_ip                    = "10.0.99.23"

security_group_name           = "Test_ec2_vpc-002-sg-002-ts"

security_group_role           = "UPSA-cicd-ec2"

ingress_ports                 = [ 0 ]

subnet_num 		                = 3

security_group_cidr_block     = "10.0.0.0/24"

security_group_description    = "Default Security Group to Allow Local Access to the UPSA Network"

dynamic_ingress_description   = "UPSA-NETWORK"

instance_type                 = "t2.large"

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

    }

  ]
