# ------------------------------------------------------------------------------
# VPC
# Version: 1.0.0
# ------------------------------------------------------------------------------

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.14.2"

  // Basic configuration
  name                     = "${local.common_tags.Project_Name}-vpc"
  cidr                     = var.network_address_space // "172.16.0.0/16"
  azs                      = [var.availablity_zone_a, var.availablity_zone_b]
  enable_dns_hostnames     = true
  enable_nat_gateway       = true
  single_nat_gateway       = true
  enable_dhcp_options      = true
  dhcp_options_domain_name = var.private_dns_name

  // Subnets configuration
  private_subnets = [var.private_subnet1_address_space, var.private_subnet2_address_space] // TODO - 3?
  public_subnets  = [var.public_subnet1_address_space, var.public_subnet2_address_space]   // TODO - 3?

  // Subnet tags
  public_subnet_tags = {
    "kubernetes.io/cluster/${local.eks_cluster_name}" = "shared"
    "kubernetes.io/role/elb"                          = "1"
  }

  private_subnet_tags = {
    "kubernetes.io/cluster/${local.eks_cluster_name}" = "shared"
    "kubernetes.io/role/internal-elb"                 = "1"
  }

  // Tags
  tags = merge(
    local.common_tags, {
      EKS_Cluster_Name                                  = local.eks_cluster_name
      "kubernetes.io/cluster/${local.eks_cluster_name}" = "shared"
    }
  )
}