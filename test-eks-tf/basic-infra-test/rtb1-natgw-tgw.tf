resource "aws_route_table" "rtb1-natgw-tgw" {
  count            = var.mycount
  propagating_vgws = []
  route = [
    {
      cidr_block                 = "0.0.0.0/0"
      egress_only_gateway_id     = ""
      gateway_id                 = ""
      instance_id                = null
      ipv6_cidr_block            = null
      nat_gateway_id             = aws_nat_gateway.mynatgw[count.index].id
      network_interface_id       = ""
      transit_gateway_id         = ""
      vpc_peering_connection_id  = ""
      local_gateway_id           = ""
      vpc_endpoint_id            = ""
      carrier_gateway_id         = ""
      destination_prefix_list_id = ""
      core_network_arn           = ""
    },
  ]
  tags   = {}
  vpc_id = aws_vpc.VPC[count.index].id
}
