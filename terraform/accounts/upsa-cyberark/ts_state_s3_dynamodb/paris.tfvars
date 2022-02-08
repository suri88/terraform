###############################################################################
# Terraform state variables
###############################################################################
region = "eu-west-3"
s3_bucket_principal_identifiers=["arn:aws:iam::762127463824:user/jenkinsusr","arn:aws:iam::707783183724:role/jenkins"]
terraform_state_name = "upsa-cyberark-terraform-state"
terraform_state_role = "cyberark"
s3_bucket_name = "upsa.eu.west.3.cyberark.terraform-remote-state"
s3_key_name = "upsa-cyberark/terraform.tfstate"
dynamodbtbl_name = "cyberark-dynamodb-tf-state-lock-tbl"
dynamodbtbl_hash_key = "LockID"
dynamodbtbl_read_capacity = 10
dynamodbtbl_write_capacity = 10
