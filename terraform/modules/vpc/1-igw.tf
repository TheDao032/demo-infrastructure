resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = merge(
    { Name = var.environment },
    var.tags
  )
}