terraform {
  backend "s3" {

    key = "upsa-cicd/rds/mssql/par-cicd-dev-poc-rds-001/terraform.tfstate"

  }
}
