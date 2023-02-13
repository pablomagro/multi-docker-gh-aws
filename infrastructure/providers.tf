provider "aws" {
  region = "ap-southeast-2"
  # access_key = var.aws_access_key
  # secret_key = var.aws_secret_key
}

module "multi_docker_sg_module" {
  source = "./modules/security-group"
}
