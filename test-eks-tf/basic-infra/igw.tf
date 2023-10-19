resource "aws_internet_gateway" "myigw" {
  count  = var.mycount
  tags   = {}
  vpc_id = aws_vpc.VPC[count.index].id
}
