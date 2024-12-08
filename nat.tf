resource "aws_nat_gateway" "nat" {
  count = var.single_nat_gateway ? 1 : length(var.public_subnet_cidrs)

  allocation_id = aws_eip.nat[count.index].id
  subnet_id     = element(aws_subnet.public[*].id, count.index)
  tags = {
    Name = "${var.name_prefix}-nat-gateway-${count.index + 1}"
  }
}
