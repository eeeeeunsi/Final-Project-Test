resource "aws_nat_gateway" "mynatgw" {
  count         = var.mycount
  allocation_id = aws_eip.my-eip[count.index].id
  subnet_id     = aws_subnet.mypubsubnet[count.index].id
  tags          = {}
}
