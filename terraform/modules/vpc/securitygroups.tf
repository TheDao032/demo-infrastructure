locals {
  service_ports = [80, 443]
}

resource "aws_security_group" "eks_node" {
  name        = "${var.environment}-eks-application-sg"
  description = "EKS Application Security Groups"
  vpc_id      = aws_vpc.main.id

  tags = merge(
    { Name = "${var.environment}-eks-application-sg" },
    var.tags
  )
}

resource "aws_security_group_rule" "eks_node_egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = ["::/0"]
  security_group_id = aws_security_group.eks_node.id
}

resource "aws_security_group_rule" "eks_node_ingress" {
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  security_group_id = aws_security_group.eks_node.id
  self              = true
}

resource "aws_security_group" "eks" {
  name        = "${var.environment}-eks-sg"
  description = "EKS Security Groups"
  vpc_id      = aws_vpc.main.id

  ingress {
    description     = "Api server - Application"
    from_port       = 0
    to_port         = 0
    protocol        = "all"
    security_groups = [aws_security_group.eks_node.id]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = merge(
    { Name = "${var.environment}-eks-sg" },
    var.tags
  )
}
