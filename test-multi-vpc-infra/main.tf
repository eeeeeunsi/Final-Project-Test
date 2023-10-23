################################################################################
# VPC
################################################################################
module "dev_vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = local.dev-name
  cidr = local.dev-cidr

  azs             = local.azs
  private_subnets = ["10.10.11.0/24", "10.10.21.0/24"] # for EKS
  public_subnets  = ["10.10.1.0/24"]                   # for NAT
  private_subnet_tags = {
    "Name" = "${local.dev-name}-private-subnet"
  }

  public_subnet_tags = {
    "Name" = "${local.dev-name}-public-subnet"
  }

  enable_nat_gateway = true
  single_nat_gateway = true
  igw_tags = {
    "Name" = "${local.dev-name}-igw"
  }
  nat_gateway_tags = {
    "Name" = "${local.dev-name}-nat"
  }

  enable_vpn_gateway   = false
  enable_dns_hostnames = false
  enable_dns_support   = true

  tags = merge({
    "Name" = "${local.dev-name}-vpc"
  }, local.common_tags)
}

module "prd_vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = local.prd-name
  cidr = local.prd-cidr

  azs             = local.azs
  private_subnets = ["10.20.11.0/24", "10.20.21.0/24"] # for EKS
  public_subnets  = ["10.20.1.0/24"]                   # for NAT
  private_subnet_tags = {
    "Name" = "${local.prd-name}-private-subnet"
  }

  public_subnet_tags = {
    "Name" = "${local.prd-name}-public-subnet"
  }

  enable_nat_gateway = true
  single_nat_gateway = true
  igw_tags = {
    "Name" = "${local.prd-name}-igw"
  }
  nat_gateway_tags = {
    "Name" = "${local.prd-name}-nat"
  }

  enable_vpn_gateway   = false
  enable_dns_hostnames = false
  enable_dns_support   = true

  tags = merge({
    "Name" = "${local.prd-name}-vpc"
  }, local.common_tags)
}

module "mgmt_vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = local.mgmt-name
  cidr = local.mgmt-cidr

  azs             = local.azs
  private_subnets = ["10.30.11.0/24"]                # for mgmt
  public_subnets  = ["10.30.1.0/24", "10.30.2.0/24"] # for NAT, bastion
  private_subnet_tags = {
    "Name" = "${local.mgmt-name}-private-subnet"
  }

  public_subnet_tags = {
    "Name" = "${local.mgmt-name}-public-subnet"
  }

  enable_nat_gateway = true
  single_nat_gateway = true
  igw_tags = {
    "Name" = "${local.mgmt-name}-igw"
  }
  nat_gateway_tags = {
    "Name" = "${local.mgmt-name}-nat"
  }

  enable_vpn_gateway   = false
  enable_dns_hostnames = false
  enable_dns_support   = true

  tags = merge({
    "Name" = "${local.mgmt-name}-vpc"
  }, local.common_tags)
}

output "dev_vpc_id" {
  value = module.dev_vpc.vpc_id
}

output "prd_vpc_id" {
  value = module.prd_vpc.vpc_id
}

output "mgmt_vpc_id" {
  value = module.mgmt_vpc.vpc_id
}
