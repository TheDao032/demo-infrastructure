resource "aws_vpc" "main" {
  cird_block = "10.0.0.0/16"

  enable_dns_support   = true # default = true
  enable_dns_hostnames = true # default = false

  tags = merge(
    { Name = var.env },
    var.tags
  )
}
