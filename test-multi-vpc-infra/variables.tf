variable "credential_files" {
  description = "File path of the AWS Credentials"
  type        = list(string)
  default     = ["C:/Users/admin/.aws/credentials"]
}

variable "profile" {
  description = "User name of the AWS Credentials"
  type        = string
  default     = "tf-user"
}

variable "region" {
  description = "Region"
  default     = "ap-northeast-2"
}

variable "azs" {
  description = "List of availability zones"
  default     = ["ap-northeast-2a", "ap-northeast-2c"]
}

variable "vpcs" {
  description = "Map of VPC CIDRs"
  default = {
    staging = "10.10.0.0/16",
    prd     = "10.20.0.0/16",
    mgmt    = "10.30.0.0/16"
  }
}

variable "public_subnet_count" {
  description = "Number of public subnets to create per VPC"
  type        = number
  default     = 2
}

variable "private_subnet_count" {
  description = "Number of private subnets to create per VPC"
  type        = number
  default     = 2
}

variable "database_subnet_count" {
  description = "Number of database subnets to create per VPC"
  type        = number
  default     = 2
}

variable "common_tags" {
  description = "Common tags for all resources"
  type        = map(string)
  default = {
    "ManagedBy" = "Terraform"
    "Project"   = "BoB-Final"
  }
}