terraform {
  backend "s3" {
    bucket = "multi-docker-deployment"
    key = "production/terraform.tfstate"
    region = "ap-southeast-2"
  }
}
