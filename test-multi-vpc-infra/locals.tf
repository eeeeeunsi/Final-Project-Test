locals {
  region = "ap-northeast-2"
  azs    = ["ap-northeast-2a", "ap-northeast-2c"]

  common_tags = {
    ManagedBy = "Terraform"
    Project   = "BoB-Final"
  }

  dev-name  = "dev"
  prd-name  = "prd"
  mgmt-name = "mgmt"

  dev-cidr  = "10.10.0.0/16"
  prd-cidr  = "10.20.0.0/16"
  mgmt-cidr = "10.30.0.0/16"

}