resource "aws_route_table_association" "myrtbassociation2" {
  count          = var.mycount
  route_table_id = aws_route_table.rtb1-natgw-tgw[count.index].id
  subnet_id      = aws_subnet.myprivsubnet[count.index].id
}
