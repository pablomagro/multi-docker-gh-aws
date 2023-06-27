# ------------------------------------------------------------------------------
# EKS Cluster
# Version: 1.0.0
# ------------------------------------------------------------------------------

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "17.24.0"

  cluster_version  = var.kubernetes_version
  cluster_name     = local.eks_cluster_name
  subnets          = module.vpc.private_subnets
  enable_irsa      = var.cluster_irsa
  write_kubeconfig = "true"
  vpc_id           = module.vpc.vpc_id

  worker_groups = [
    {
      name                          = "worker-group-client"
      instance_type                 = var.client_instance_type
      asg_desired_capacity          = 2
      additional_security_group_ids = [aws_security_group.all_eks_worker_mgmt.id]
      kubelet_extra_args            = "--node-labels=role=client"
    },
    {
      name                          = "worker-group-server"
      instance_type                 = var.server_instance_type
      asg_desired_capacity          = 2
      additional_security_group_ids = [aws_security_group.all_eks_worker_mgmt.id]
      kubelet_extra_args            = "--node-labels=role=server"
    }
  ]

  map_users = [
    {
      userarn  = var.eks_userarn
      username = var.eks_username
      groups   = ["system:masters"]
    },
  ]

  // Tags
  tags = merge(
    local.common_tags, {
      Name = local.eks_cluster_name
    }
  )
}