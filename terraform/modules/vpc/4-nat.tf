resource "aws_eip" "nat" {
  count  = length(var.public_cidr)
  domain = "vpc"

  tags = merge(
    { Name = "${var.environment}-NAT-${count.index}" },
    var.tags
  )

  depends_on = [aws_internet_gateway.main]
}

resource "aws_nat_gateway" "main" {
  count         = length(var.public_cidr)
  allocation_id = aws_eip.nat[count.index].id
  subnet_id     = aws_subnet.public[count.index].id

  tags = merge(
    { Name = "${var.environment}-${count.index}" },
    var.tags
  )

  depends_on = [aws_internet_gateway.main]
}
