output "demo_infra_ip_addr" {
  value = aws_instance.demo_infra.public_ip
}
