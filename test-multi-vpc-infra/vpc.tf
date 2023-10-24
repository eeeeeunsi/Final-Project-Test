################################################################################
# VPCs
################################################################################
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  count = length(var.vpcs)

  name = keys(var.vpcs)[count.index]
  cidr = var.vpcs[keys(var.vpcs)[count.index]]

  azs              = var.azs
  public_subnets   = local.public_subnet_cidrs[keys(var.vpcs)[count.index]]
  private_subnets  = local.private_subnet_cidrs[keys(var.vpcs)[count.index]]
  database_subnets = local.database_subnet_cidrs[keys(var.vpcs)[count.index]]

  enable_nat_gateway = true
  single_nat_gateway = true

  tags = merge({
    Name = "${keys(var.vpcs)[count.index]}-vpc"
  }, var.common_tags)

  public_subnet_tags = merge({
    "Name" = "${keys(var.vpcs)[count.index]}-pub"
  }, var.common_tags)

  private_subnet_tags = merge({
    "Name" = "${keys(var.vpcs)[count.index]}-pri"
  }, var.common_tags)

  database_subnet_tags = merge({
    "Name" = "${keys(var.vpcs)[count.index]}-db"
  }, var.common_tags)
}
