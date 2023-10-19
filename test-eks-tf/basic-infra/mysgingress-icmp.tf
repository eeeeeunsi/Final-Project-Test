resource "aws_security_group_rule" "mysgingress-icmp" {
  count = var.mycount
  cidr_blocks = [
    #for avpc in var.aws_vpc :
    #lookup(var.aws_cidr, avpc)  
    "10.0.0.0/8"
  ]
  from_port         = -1
  ipv6_cidr_blocks  = []
  prefix_list_ids   = []
  protocol          = "icmp"
  security_group_id = aws_security_group.mysg[count.index].id
  to_port           = -1
  type              = "ingress"
}
