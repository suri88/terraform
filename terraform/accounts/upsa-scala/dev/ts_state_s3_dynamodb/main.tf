###############################################################################
# Setup our AWS Provider!..
###############################################################################

provider "aws" {
    region  = var.region
    version = "~> 2.56"
}

locals {

  bucket_name       = var.s3_bucket_name
  #key_name          = var.s3_key_name   #"upsa-cicd/terraform.tfstate"
  dynamodbtbl_name  = var.dynamodbtbl_name  #"dynamodb-tf-state-lock-tbl"
  dynamodbtbl_hash_key        = var.dynamodbtbl_hash_key #"LockID"
  dynamodbtbl_read_capacity   = var.dynamodbtbl_read_capacity  #20
  dynamodbtbl_write_capacity  = var.dynamodbtbl_write_capacity  #20

  tags = merge(module.upsa-tags.upsa_aws_cicd_dev_env_default_tags, map(
    "Name", format ("%s",var.terraform_state_name),
    "Role", var.terraform_state_role
    )
   )
}

data "aws_iam_policy_document" "s3_bucket_policy" {
  statement {

      sid = "ListBucket"
      effect = "Allow"
      principals  {
        type        = "AWS"
        identifiers = var.s3_bucket_principal_identifiers

      }

      actions = ["s3:ListBucket"]
      resources = ["arn:aws:s3:::${local.bucket_name}"]
    }

  statement  {
      sid = "CreateGetPutObject"
      effect = "Allow"
      principals  {
        type        = "AWS"
        identifiers = var.s3_bucket_principal_identifiers

      }
      actions = [
        "s3:GetObject",
        "s3:PutObject"
      ]

      resources = ["arn:aws:s3:::${local.bucket_name}/*"]
    }

}

module s3_bucket {
  source = "../../../../modules/s3"

  bucket        = local.bucket_name
  region        = var.region

  acl           = "private"
  force_destroy = false

  attach_policy = true
  policy = data.aws_iam_policy_document.s3_bucket_policy.json

  tags = local.tags

  versioning = {
      enabled = true
  }
}


/*data "aws_iam_policy_document" "dynamodb_policy" {
  statement  {
      effect = "Allow"

      actions = [
        "dynamodb:GetItem",
        "dynamodb:PutItem",
        "dynamodb:DeleteItem"
      ]

      resources = ["arn:aws:dynamodb:*:*:table/${local.dynamodbtbl_name}"]
    }

}

data "aws_iam_policy_document" "dynamodb_assume_role_policy" {
  statement {

   effect = "Allow"
   actions = ["sts:AssumeRole"]

   principals  {
     type        = "AWS"
     identifiers = ["arn:aws:iam::762127463824:user/jenkinsusr"]

   }
  }
}

resource "aws_iam_policy" "dynamodb_policy" {
  name        = "dynamodb_policy_${local.dynamodbtbl_name}"
  description = "dynamodb_policy for terraform state"
  policy      =  data.aws_iam_policy_document.dynamodb_policy.json
}

resource "aws_iam_role" "dynamodb_terraform_state_role" {
  name               = "dynamodb_terraform_state_role_${local.dynamodbtbl_name}"
  assume_role_policy = data.aws_iam_policy_document.dynamodb_assume_role_policy.json
}

resource "aws_iam_policy_attachment" "dynamodb_policy_attachment" {
  name       = "dynamodb_policy_attachment_${local.dynamodbtbl_name}"
  roles      = [aws_iam_role.dynamodb_terraform_state_role.name]
  policy_arn = aws_iam_policy.dynamodb_policy.arn
} */

module dynamodb_table {
  source          = "../../../../modules/dynamodb"

  tbl_name              = local.dynamodbtbl_name
  tbl_hash_key          = local.dynamodbtbl_hash_key
  tbl_read_capacity     = local.dynamodbtbl_read_capacity
  tbl_write_capacity    = local.dynamodbtbl_write_capacity
  tags = local.tags
}


module upsa-tags {
    source = "../../../../modules/upsa-tags"

}
