resource "aws_security_group" "multi-docker" {
  name = "multi-docker"
  description = "Traffic for services in multi-docker application"

  ingress {
    from_port = 5432
    to_port = 6379
    protocol    = "tcp"
    cidr_blocks = []
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    "Name": "multi-docker"
  }
}

output "sg_id" {
  value = aws_security_group.multi-docker.id
}
