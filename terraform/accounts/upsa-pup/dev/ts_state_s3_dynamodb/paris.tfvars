###############################################################################
# Terraform state variables
###############################################################################
region = "eu-west-3"
s3_bucket_principal_identifiers=["arn:aws:iam::762127463824:user/jenkinsusr","arn:aws:iam::707783183724:role/jenkins"]
terraform_state_name = "upsa-pup-dev-terraform-state"
terraform_state_role = "pup-dev"
s3_bucket_name = "upsa.eu.west.3.pup-dev.terraform-remote-state"
dynamodbtbl_name = "pup-dev-dynamodb-tf-state-lock-tbl"
dynamodbtbl_hash_key = "LockID"
dynamodbtbl_read_capacity = 5
dynamodbtbl_write_capacity = 5
