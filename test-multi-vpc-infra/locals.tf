locals {
  azs  = var.azs
  vpcs = var.vpcs
  
  public_subnet_cidrs = {
    for vpc_key, vpc_cidr in local.vpcs : vpc_key => [
      for i in range(var.public_subnet_count) : cidrsubnet(vpc_cidr, 8, i)
    ]
  }

  private_subnet_cidrs = {
    for vpc_key, vpc_cidr in local.vpcs : vpc_key => [
      for i in range(var.private_subnet_count) : cidrsubnet(vpc_cidr, 8, i + var.public_subnet_count)
    ]
  }

  database_subnet_cidrs = {
    for vpc_key, vpc_cidr in local.vpcs : vpc_key => [
      for i in range(var.database_subnet_count) : cidrsubnet(vpc_cidr, 8, i + var.public_subnet_count + var.private_subnet_count)
    ]
  }
}