resource "aws_security_group_rule" "mysgingress-80" {
  count = var.mycount
  cidr_blocks = [
    "10.0.0.0/8"
  ]

  from_port         = 80
  ipv6_cidr_blocks  = []
  prefix_list_ids   = []
  protocol          = "tcp"
  security_group_id = aws_security_group.mysg[count.index].id
  to_port           = 80
  type              = "ingress"
}
