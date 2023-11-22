################################################################################
# JP-PRD-VPC
################################################################################
module "jp-prd-vpc" {
  source      = "./module/vpc"
  module_name = "jp-prd-vpc"

  vpc_cidr = "10.10.0.0/16"
  public_subnets = {
    "subnet_a1" = {
      cidr = "10.10.1.0/24",
      az   = "ap-northeast-1a",
      tags = {
        Name        = "PRD-pub-sbnt-1a"
        Environment = "Terraform"
        Project     = "BoB-Final"
        "kubernetes.io/cluster/jp-prd-eks" = "shared"
        "kubernetes.io/role/elb"           = 1
      }
    },
    "subnet_b1" = {
      cidr = "10.10.11.0/24",
      az   = "ap-northeast-1c",
      tags = {
        Name        = "PRD-pub-sbnt-1c"
        Environment = "Terraform"
        Project     = "BoB-Final"
        "kubernetes.io/cluster/jp-prd-eks" = "shared"
        "kubernetes.io/role/elb"           = 1
      }
    }
  }
  private_subnets = {
    "subnet_a1" = {
      cidr = "10.10.2.0/24",
      az   = "ap-northeast-1a",
      tags = {
        Name                              = "PRD-pri1-sbnt-1a"
        Environment                       = "Terraform"
        Project                           = "BoB-Final"
        "kubernetes.io/cluster/prd-eks"   = "shared"
        "kubernetes.io/role/internal-elb" = 1
      }
    },
    "subnet_a2" = {
      cidr = "10.10.3.0/24",
      az   = "ap-northeast-1a",
      tags = {
        Name        = "PRD-pri2-sbnt-1a"
        Environment = "Terraform"
        Project     = "BoB-Final"
      }
    },
    "subnet_b1" = {
      cidr = "10.10.12.0/24",
      az   = "ap-northeast-1c",
      tags = {
        Name                              = "PRD-pri1-sbnt-1c"
        Environment                       = "Terraform"
        Project                           = "BoB-Final"
        "kubernetes.io/cluster/prd-eks"   = "shared"
        "kubernetes.io/role/internal-elb" = 1
      }
    },
    "subnet_b2" = {
      cidr = "10.10.13.0/24",
      az   = "ap-northeast-1c",
      tags = {
        Name        = "PRD-pri2-sbnt-1c"
        Environment = "Terraform"
        Project     = "BoB-Final"
      }
    }
  }
}
