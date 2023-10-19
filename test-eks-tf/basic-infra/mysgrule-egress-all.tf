resource "aws_security_group_rule" "mysgegress" {
  count = var.mycount
  cidr_blocks = [
    "0.0.0.0/0",
  ]
  from_port         = 0
  ipv6_cidr_blocks  = []
  prefix_list_ids   = []
  protocol          = "-1"
  security_group_id = aws_security_group.mysg[count.index].id
  to_port           = 0
  type              = "egress"
}
