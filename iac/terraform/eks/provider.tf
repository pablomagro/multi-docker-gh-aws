# ------------------------------------------------------------------------------
# Providers
# Version: 1.0.0
# ------------------------------------------------------------------------------

provider "aws" {
  region = var.aws_region
  # profile = var.aws_cli_profile
}

terraform {
  required_version = ">= 1.4.4"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  backend "s3" {
    bucket  = "terraform-provisioning-bucket-nz"
    key     = "fib-calculator-eks/terraform.tfstate"
    region  = "ap-southeast-2"
    encrypt = true
  }
}