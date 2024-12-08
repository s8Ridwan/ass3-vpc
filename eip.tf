resource "aws_eip" "nat" {
  count = var.single_nat_gateway ? 1 : length(var.public_subnet_cidrs)

  tags = {
    Name = "${var.name_prefix}-nat-eip-${count.index + 1}"
  }
}
