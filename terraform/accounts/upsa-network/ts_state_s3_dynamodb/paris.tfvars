###############################################################################
# Terraform state variables
###############################################################################
region = "eu-west-3"
s3_bucket_principal_identifiers=["arn:aws:iam::762127463824:user/jenkinsusr","arn:aws:iam::707783183724:role/jenkins"]
terraform_state_name = "upsa-ntw-terraform-state"
terraform_state_role = "network"
s3_bucket_name = "upsa.eu.west.3.ntw.terraform-remote-state"
#s3_key_name = "upsa-network/terraform.tfstate"
dynamodbtbl_name = "network-dynamodb-tf-state-lock-tbl"
dynamodbtbl_hash_key = "LockID"
dynamodbtbl_read_capacity = 10
dynamodbtbl_write_capacity = 10
