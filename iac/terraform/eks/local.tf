# ------------------------------------------------------------------------------
# Locals
# Version: 1.0.0
# ------------------------------------------------------------------------------

resource "random_string" "id" {
  length  = 6
  upper   = false
  lower   = false
  numeric = true
  special = false
}

locals {
  asset_id = random_string.id.result
}

locals {
  eks_cluster_name              = "${local.asset_id}-eks-${var.project_name}-${var.environment}"
  k8s_service_account_namespace = "default"
  k8s_service_account_name      = "exampleapp-service-account"

  common_tags = {
    Owner                        = var.owner
    Environment_Name             = var.environment_name
    Project_Name                 = var.project_name
    Resource_Owner               = var.asset_owner
    Environment_Type             = var.environment
    Application_Asset_Insight_ID = local.asset_id
  }
}