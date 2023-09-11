resource "aws_vpc" "main" {
  cird_block = var.vpc_cidr_block

  enable_dns_support   = true # default = true
  enable_dns_hostnames = true # default = false

  tags = merge(
    { Name = var.environment },
    var.tags
  )
}
