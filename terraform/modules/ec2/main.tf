resource "aws_instance" "demo_infra" {
  ami             = var.ami
  instance_type   = var.instance_type
}
