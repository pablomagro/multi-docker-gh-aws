# ------------------------------------------------------------------------------
# Data
# Version: 1.0.0
# ------------------------------------------------------------------------------

data "aws_region" "current" {}

## EKS Cluster Id
data "aws_eks_cluster" "eks" {
  name = module.eks.cluster_id
}

## EKS Cluster Auth
data "aws_eks_cluster_auth" "eks" {
  name = module.eks.cluster_id
}