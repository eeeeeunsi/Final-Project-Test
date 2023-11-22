terraform {
  required_version = "> 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.3.0"
    }
  }
}

provider "aws" {
  region                   = "ap-northeast-1"
  shared_credentials_files = ["C:/Users/admin/.aws/credentials"]
  profile                  = "tf-user"
}