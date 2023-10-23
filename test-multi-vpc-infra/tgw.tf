################################################################################
# Transit Gateway
################################################################################
# module "transit_gateway" {
#   source = "terraform-aws-modules/transit-gateway/aws"

#   name                                  = "BoB-tgw"
#   description                           = "Transit Gateway to connect VPCs"
#   enable_auto_accept_shared_attachments = true

#   vpc_attachments = {
#     dev = {
#       vpc_id      = module.dev_vpc.vpc_id
#       subnet_ids = module.dev_vpc.private_subnets
#       dns_support = true

#       transit_gateway_default_route_table_association = false
#       transit_gateway_default_route_table_propagation = false

#       tgw_routes = [
#         { destination_cidr_block = local.prd-cidr },
#         { destination_cidr_block = local.mgmt-cidr }
#       ]

#     },
#     prd = {
#       vpc_id      = module.prd_vpc.vpc_id
#       subnet_ids = module.prd_vpc.private_subnets
#       dns_support = true

#       transit_gateway_default_route_table_association = false
#       transit_gateway_default_route_table_propagation = false

#       tgw_routes = [
#         { destination_cidr_block = local.dev-cidr },
#         { destination_cidr_block = local.mgmt-cidr }
#       ]

#     },
#     mgmt = {
#       vpc_id      = module.mgmt_vpc.vpc_id
#       subnet_ids = module.mgmt_vpc.private_subnets
#       dns_support = true

#       transit_gateway_default_route_table_association = false
#       transit_gateway_default_route_table_propagation = false

#       tgw_routes = [
#         { destination_cidr_block = local.dev-cidr },
#         { destination_cidr_block = local.prd-cidr }
#       ]
#     },
#   }
# }