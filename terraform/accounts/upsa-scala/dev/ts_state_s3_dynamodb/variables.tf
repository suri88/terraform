variable "region" {
  type = "string"
  description = "AWS Region"
}

variable "terraform_state_name" {
  description = "The name of the terraform state"
  type        = string
}

variable "terraform_state_role" {
  description = "The role of terraform state"
  type        = string
}


variable "s3_bucket_name" {
  description = "(Optional, Forces new resource) The name of the bucket. If omitted, Terraform will assign a random, unique name."
  type        = string
}

variable "s3_bucket_principal_identifiers" {
  description = "s3_bucket_principal_identifiers"
  type        = list(string)
}

/*
variable "s3_key_name" {
  description = "The name of the key in S3-bucket."
  type        = string
} */

variable "dynamodbtbl_name" {
  description = "The name of the dynamodb table"
  type        = string
}

variable "dynamodbtbl_hash_key" {
  description = "The name of the key in S3-bucket."
  type        = string
}

variable "dynamodbtbl_read_capacity" {
  description = "The read capacity of dynamodb table."
  type        = number
}

variable "dynamodbtbl_write_capacity" {
  description = "The write capacity of dynamodb table."
  type        = number
}
