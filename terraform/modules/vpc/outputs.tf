output "azs" {
  value = join(",", local.azs)
}

output "id" {
  value = aws_vpc.main.id
}

output "public_subnets" {
  value = join(",", [for subnet in aws_subnet.public : subnet.id])
}

output "private_subnets" {
  value = join(",", [for subnet in aws_subnet.private : subnet.id])
}
