# ------------------------------------------------------------------------------
# Data
# Version: 1.0.0
# ------------------------------------------------------------------------------

data "aws_region" "current" {}

# data "aws_availability_zones" "available" {}

## EKS Cluster Id: Poll the cluster to make sure it's ready.
data "aws_eks_cluster" "eks" {
  name = module.eks.cluster_id
}

## EKS Cluster Auth: Set up the right permissions to connect to the cluster.
data "aws_eks_cluster_auth" "eks" {
  name = module.eks.cluster_id
}