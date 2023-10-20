module "vpc" {
  source = "./module/vpc"

  vpc_cidr = "10.0.0.0/16"
  public_subnets = {
    "subnet_a1" = {
      cidr = "10.0.1.0/24",
      az   = "ap-northeast-2a",
      tags = {
        Name = "test-public-subnet-2a"
      }
    },
    "subnet_b1" = {
      cidr = "10.0.11.0/24",
      az   = "ap-northeast-2c",
      tags = {
        Name = "test-public-subnet-2c"
      }
    }
  }
  private_subnets = {
    "subnet_a1" = {
      cidr = "10.0.2.0/24",
      az   = "ap-northeast-2a",
      tags = {
        Name = "test-private-subnet-2a"
      }
    },
    "subnet_b1" = {
      cidr = "10.0.22.0/24",
      az   = "ap-northeast-2c",
      tags = {
        Name = "test-private-subnet-2a"
      }
    }
  }
}

module "eks" {
  source = "./module/eks"

  eks_name                = "test-eks"
  eks_version             = "1.27"
  vpc_id                  = module.vpc.vpc_id
  private_subnets_ids     = module.vpc.private_subnets_ids
  endpoint_prviate_access = true
  endpoint_public_access  = true
  managed_node_groups = {
    "managed-node-group-a" = {
      node_group_name = "prod-node-group",
      instance_types  = ["t2.micro"],
      capacity_type   = "ON_DEMAND",
      release_version = "" #latest
      disk_size       = 10
      desired_size    = 1,
      max_size        = 1,
      min_size        = 1
    }
  }
  aws_auth_admin_roles = ["arn:aws:iam::560971842042:role/eks-admin-role"]
}