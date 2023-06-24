terraform {
  backend "s3" {
    bucket  = "terraform-provisioning-bucket-nz"
    key     = "multi-docker-gh/terraform.tfstate"
    region  = "ap-southeast-2"
    encrypt = true
  }
}
