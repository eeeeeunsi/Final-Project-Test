terraform {
  required_version = "> 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= 5.3.0"
    }
  }
}

provider "aws" {
  region                   = local.region
  shared_credentials_files = var.credential_files
  profile                  = var.profile
}