#########################################################################################
# UPSA Global Tags that will be applied to all Default VPC's in the AWS Environment
#########################################################################################
variable upsa_aws_default_vpc_tags {
  type        = map(string)
  description = "Default tags to be applied to the AWS default VPC"
  default = {
    BusinessOwner     = "AWS"
    ProvisionedBy     = "Amazon Web Services"
    ProvisioningTool  = "Terraform"
  }
}
#########################################################################################
# UPSA Global tags to be applied to all AWS resources created in the Network-Edge
#########################################################################################
variable upsa_aws_ntw_env_default_tags {
  type        = map(string)
  description = "Default tags to be applied to all resources created in the AWS UPSA environment"
  default = {
    BusinessOwner       = "UPSA Automation"
    BusinessUnit        = "dev"
    CostCentre          = "Not Applicable"
    DataCentre          = "Paris"
    Email               = "upsa-automation@wipro.com"
    Project             = "IaC"
    ProvisioningTool    = "Terraform"
  }
}
#########################################################################################
# Global tags to be applied to all AWS resources created in CI-CD
#########################################################################################
variable upsa_aws_cicd_dev_env_default_tags {
  type        = map(string)
  description = "Default tags to be applied to all resources created in Shared Services"
  default = {
    BusinessOwner       = "Upsa-Automation"
    BusinessUnit        = "dev"
    CostCentre          = "Not Applicable"
    DataCentre          = "Paris"
    Email               = "upsa-automation@wipro.com"
    Project             = "IaC"
    ProvisioningTool    = "Terraform"
  }
}

#########################################################################################
# Global tags to be applied to all AWS resources created in Shared-Services
#########################################################################################
variable upsa_aws_sss_prd_env_default_tags {
  type        = map(string)
  description = "Default tags to be applied to all resources created in Shared Services"
  default = {
    BusinessOwner       = "UPSA Automation"
    BusinessUnit        = "prd"
    CostCentre          = "Not Applicable"
    DataCentre          = "Paris"
    Email               = "upsa-automation@wipro.com"
    Project             = "Common-Infra"
    ProvisioningTool    = "Terraform"
  }
}

#########################################################################################
# Global tags to be applied to all AWS resources created in Talend dev
#########################################################################################
variable upsa_aws_talend_dev_env_default_tags {
  type        = map(string)
  description = "Default tags to be applied to all resources created in Talend dev environment"
  default = {
    BusinessOwner       = "Paul Canourgues"
    BusinessUnit        = "Commercial"
    CostCentre          = "9020135"
    DataCentre          = "Paris"
    Email               = "UPSA-AWSTalend-dev@wipro.com"
    Project             = "IaC"
    ProvisioningTool    = "Terraform"
  }
}

#########################################################################################
# Global tags to be applied to all AWS resources created in CyberArk
#########################################################################################
variable upsa_aws_cyberark_prd_env_default_tags {
  type        = map(string)
  description = "Default tags to be applied to all resources created in Talend dev environment"
  default = {
    BusinessOwner       = "UPSA Automation"
    BusinessUnit        = "prd"
    CostCentre          = "Not Applicable"
    DataCentre          = "Paris"
    Email               = "upsa-automation@wipro.com"
    Project             = "Common-Infra"
    ProvisioningTool    = "Terraform"
  }
}

#########################################################################################
# Global tags to be applied to all AWS resources created in EasyLog
#########################################################################################
variable upsa_aws_easylog_dev_env_default_tags {
  type        = map(string)
  description = "Default tags to be applied to all resources created in EasyLog Dev environment"
  default = {
    BusinessOwner       = "Paul Canourgues"
    BusinessUnit        = "IT"
    CostCentre          = "9020135"
    DataCentre          = "Paris"
    Email               = "UPSA-AWSEasyLog-dev@wipro.com"
    Project             = "IaC"
    ProvisioningTool    = "Terraform"
  }
}


variable upsa_aws_easylog_uat_env_default_tags {
  type        = map(string)
  description = "Default tags to be applied to all resources created in EasyLog UAT environment"
  default = {
    BusinessOwner       = "Paul Canourgues"
    BusinessUnit        = "IT"
    CostCentre          = "9020135"
    DataCentre          = "Paris"
    Email               = "UPSA-AWSEasyLog-uat@wipro.com"
    Project             = "IaC"
    ProvisioningTool    = "Terraform"
  }
}

variable upsa_aws_easylog_sit_env_default_tags {
  type        = map(string)
  description = "Default tags to be applied to all resources created in EasyLog SIT environment"
  default = {
    BusinessOwner       = "Paul Canourgues"
    BusinessUnit        = "IT"
    CostCentre          = "9020135"
    DataCentre          = "Paris"
    Email               = "UPSA-AWSEasyLog-sit@wipro.com"
    Project             = "IaC"
    ProvisioningTool    = "Terraform"
  }
}

variable upsa_aws_easylog_prd_env_default_tags {
  type        = map(string)
  description = "Default tags to be applied to all resources created in EasyLog Prod environment"
  default = {
    BusinessOwner       = "Paul Canourgues"
    BusinessUnit        = "IT"
    CostCentre          = "9020135"
    DataCentre          = "Paris"
    Email               = "UPSA-AWSEasyLog-prod@wipro.com"
    Project             = "IaC"
    ProvisioningTool    = "Terraform"
  }
}