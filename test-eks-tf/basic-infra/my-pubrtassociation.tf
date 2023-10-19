resource "aws_route_table_association" "myrtbassociation" {
  count          = var.mycount
  route_table_id = aws_route_table.rtb2-igw[count.index].id
  subnet_id      = aws_subnet.mypubsubnet[count.index].id
}
