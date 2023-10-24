################################################################################
# PRD-VPC
################################################################################
module "prd-vpc" {
  source = "./module/vpc"

  vpc_cidr = "10.10.0.0/16"
  public_subnets = {
    "subnet_a1" = {
      cidr = "10.10.1.0/24",
      az   = "ap-northeast-2a",
      tags = {
        Name = "PRD-public-subnet-2a",
        Madeby = "Terraform"
        Project   = "BoB-Final"
      }
    },
    "subnet_b1" = {
      cidr = "10.10.11.0/24",
      az   = "ap-northeast-2c",
      tags = {
        Name = "PRD-public-subnet-2c",
        Madeby = "Terraform"
        Project   = "BoB-Final"
      }
    }
  }
  private_subnets = {
    "subnet_a1" = {
      cidr = "10.10.2.0/24",
      az   = "ap-northeast-2a",
      tags = {
        Name = "PRD-private-subnet-2a",
        Madeby = "Terraform"
        Project   = "BoB-Final"
      }
    },
    "subnet_a2" = {
      cidr = "10.10.3.0/24",
      az   = "ap-northeast-2a",
      tags = {
        Name = "PRD-database-subnet-2a",
        Madeby = "Terraform"
        Project   = "BoB-Final"
      }
    },
    "subnet_b1" = {
      cidr = "10.10.22.0/24",
      az   = "ap-northeast-2c",
      tags = {
        Name = "PRD-private-subnet-2c",
        Madeby = "Terraform"
        Project   = "BoB-Final"
      }
    },
    "subnet_b2" = {
      cidr = "10.10.23.0/24",
      az   = "ap-northeast-2c",
      tags = {
        Name = "PRD-database-subnet-2c",
        Madeby = "Terraform"
        Project   = "BoB-Final"
      }
    }
  }
}

################################################################################
# STAGING-VPC
################################################################################
module "staging-vpc" {
  source = "./module/vpc"

  vpc_cidr = "10.20.0.0/16"
  public_subnets = {
    "subnet_a1" = {
      cidr = "10.20.1.0/24",
      az   = "ap-northeast-2a",
      tags = {
        Name = "STAGING-public-subnet-2a",
        Madeby = "Terraform"
        Project   = "BoB-Final"
      }
    },
    "subnet_b1" = {
      cidr = "10.20.11.0/24",
      az   = "ap-northeast-2c",
      tags = {
        Name = "STAGING-public-subnet-2c",
        Madeby = "Terraform"
        Project   = "BoB-Final"
      }
    }
  }
  private_subnets = {
    "subnet_a1" = {
      cidr = "10.20.2.0/24",
      az   = "ap-northeast-2a",
      tags = {
        Name = "STAGING-private-subnet-2a",
        Madeby = "Terraform"
        Project   = "BoB-Final"
      }
    },
    "subnet_a2" = {
      cidr = "10.20.3.0/24",
      az   = "ap-northeast-2a",
      tags = {
        Name = "STAGING-database-subnet-2a",
        Madeby = "Terraform"
        Project   = "BoB-Final"
      }
    },
    "subnet_b1" = {
      cidr = "10.20.22.0/24",
      az   = "ap-northeast-2c",
      tags = {
        Name = "STAGING-private-subnet-2c",
        Madeby = "Terraform"
        Project   = "BoB-Final"
      }
    },
    "subnet_b2" = {
      cidr = "10.20.23.0/24",
      az   = "ap-northeast-2c",
      tags = {
        Name = "STAGING-database-subnet-2c",
        Madeby = "Terraform"
        Project   = "BoB-Final"
      }
    }
  }
}

################################################################################
# MGMT-VPC
################################################################################
module "mgmt-vpc" {
  source = "./module/vpc"

  vpc_cidr = "10.30.0.0/16"
  public_subnets = {
    "subnet_a1" = {
      cidr = "10.30.1.0/24",
      az   = "ap-northeast-2a",
      tags = {
        Name = "MGMT-public-subnet-2a",
        Madeby = "Terraform"
        Project   = "BoB-Final"
      }
    },
    "subnet_b1" = {
      cidr = "10.30.11.0/24",
      az   = "ap-northeast-2c",
      tags = {
        Name = "MGMT-public-subnet-2c",
        Madeby = "Terraform"
        Project   = "BoB-Final"
      }
    }
  }
  private_subnets = {
    "subnet_a1" = {
      cidr = "10.30.2.0/24",
      az   = "ap-northeast-2a",
      tags = {
        Name = "MGMT-private-subnet-2a",
        Madeby = "Terraform"
        Project   = "BoB-Final"
      }
    },
    "subnet_b1" = {
      cidr = "10.30.22.0/24",
      az   = "ap-northeast-2c",
      tags = {
        Name = "MGMT-private-subnet-2c",
        Madeby = "Terraform"
        Project   = "BoB-Final"
      }
    }
  }
}

################################################################################
# PRD-EKS
################################################################################
module "prd-eks" {
  source = "./module/eks"

  eks_name                = "prd-eks"
  eks_version             = "1.27"
  vpc_id                  = module.prd-vpc.vpc_id
  private_subnets_ids     = module.prd-vpc.private_subnets_ids
  endpoint_prviate_access = true
  endpoint_public_access  = true
  managed_node_groups = {
    "managed-node-group-a" = {
      node_group_name = "prd-node-group",
      instance_types  = ["t3.medium"],
      capacity_type   = "ON_DEMAND",
      release_version = "" #latest
      disk_size       = 10
      desired_size    = 2,
      max_size        = 3,
      min_size        = 2
    }
  }
  aws_auth_admin_roles = ["arn:aws:iam::560971842042:role/eks-admin-role"]
}

################################################################################
# STAGING-EKS
################################################################################
module "staging-eks" {
  source = "./module/eks"

  eks_name                = "staging-eks"
  eks_version             = "1.27"
  vpc_id                  = module.staging-vpc.vpc_id
  private_subnets_ids     = module.staging-vpc.private_subnets_ids
  endpoint_prviate_access = true
  endpoint_public_access  = true #false -> configure-map 설정 변경 불가
  managed_node_groups = {
    "managed-node-group-a" = {
      node_group_name = "staging-node-group",
      instance_types  = ["t3.medium"],
      capacity_type   = "ON_DEMAND",
      release_version = "" #latest
      disk_size       = 10
      desired_size    = 2,
      max_size        = 3,
      min_size        = 2
    }
  }
  aws_auth_admin_roles = ["arn:aws:iam::560971842042:role/eks-admin-role"]
}