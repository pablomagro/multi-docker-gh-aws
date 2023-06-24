resource "aws_security_group" "multi_docker_gh" {
  name        = "multi-docker-gh"
  description = "Traffic for services in multi-docker application"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 5432
    to_port     = 6379
    protocol    = "tcp"
    cidr_blocks = []
    self        = "true"
    # cidr_blocks      = [aws_vpc.main.cidr_block]
    # ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    "Name": "multi-docker-gh"
  }
}

output "sg_id" {
  value = aws_security_group.multi_docker_gh.id
}
