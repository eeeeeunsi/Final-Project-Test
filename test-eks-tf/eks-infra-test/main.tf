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
