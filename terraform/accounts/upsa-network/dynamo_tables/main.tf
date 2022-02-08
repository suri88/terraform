locals {
  
  region      = "eu-west-3"
  profile     = "upsa-network"
  version     = "~> 2.47"

  db_tf_state_lock_tbl = {

    dynamodbtbl_name            = "dynamodb-tf-state-lock-tbl"
    dynamodbtbl_hash_key        = "LockID"
    dynamodbtbl_read_capacity   = 20
    dynamodbtbl_write_capacity  = 20
  }

  default_tags = {

        BusinessOwner     = "Yomi Ogunyinka"
        CostCentre        = "Not Applicable"
        DataCenter        = "Paris"
        Email             = "yomi.ogunyinka@wipro.com"
        BusinessUnit      = "dev"
        Project           = "IaC"
        ProvisioningTool  = "Console"
        Role              = "network-edge"
  }
}

provider "aws" {
  region                      = local.region
  profile                     = local.profile
  version                     = "~> 2.47"
}


module "aws_dynamodb_table" {
  source          = "../../../modules/dynamodb"

  tbl_name              = local.db_tf_state_lock_tbl.dynamodbtbl_name
  tbl_hash_key          = local.db_tf_state_lock_tbl.dynamodbtbl_hash_key
  tbl_read_capacity     = local.db_tf_state_lock_tbl.dynamodbtbl_read_capacity
  tbl_write_capacity    = local.db_tf_state_lock_tbl.dynamodbtbl_write_capacity

  tags = merge(
    {

      # Name = var.name

    },
      local.default_tags,    # Will be applied to all resources
      # var.vpc_tags,
    )
}