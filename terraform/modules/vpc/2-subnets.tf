locals {
  azs = sort(var.azs)
}

resource "aws_subnet" "public" {
  count = length(var.public_cidr)
  vpc_id = aws_vpc.main.id
  cidr_block = var.public_cidr[count.index]
  availability_zone = locals.azs[count.index]

  tags = merge(
    { Name = "${var.environment}-public-${count.index}" },
    { "kubernetes.io/cluster/${var.environment}" = "share" },
    { "kubernetes.io/role/elb" = "1" },
    var.tags
  )
}

resource "aws_subnet" "private" {
  count = length(var.private_cidr)
  vpc_id = aws_vpc.main.id
  cidr_block = var.private_cidr[count.index]
  availability_zone = locals.azs[count.index]

  tags = merge(
    { Name = "${var.environment}-private-${count.index}" },
    { "kubernetes.io/cluster/${var.environment}" = "share" },
    { "kubernetes.io/role/elb" = "1" },
    var.tags
  )
}
