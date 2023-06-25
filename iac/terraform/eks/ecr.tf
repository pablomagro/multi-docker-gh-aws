# ------------------------------------------------------------------------------
# ecr
# Version: 1.0.0
# ------------------------------------------------------------------------------

resource "aws_ecr_repository" "exampleapp-server" {
  name         = "${local.common_tags.Project_Name}-server"
  tags         = local.common_tags
  force_delete = "true"
}

resource "aws_ecr_repository" "exampleapp-client" {
  name         = "${local.common_tags.Project_Name}-client"
  tags         = local.common_tags
  force_delete = "true"
}

resource "aws_ecr_repository" "exampleapp-worker" {
  name         = "${local.common_tags.Project_Name}-worker"
  tags         = local.common_tags
  force_delete = "true"
}