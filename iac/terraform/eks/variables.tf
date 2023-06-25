# ------------------------------------------------------------------------------
# Variables
# ------------------------------------------------------------------------------

# ------------------------------------------------------------------------------
# Application
# ------------------------------------------------------------------------------

#############  AWS CLI  #############
# variable "aws_cli_profile" {
#   description = "AWS CLI profile name to create things with."
#   type        = string
#   default     = "terraform-deploy"
# }

#############  VPC Related  #############
variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-southeast-2"
}

#############  VPC Related  #############
variable "availablity_zone_a" {
  description = "AWS availability one A"
  type        = string
}

variable "availablity_zone_b" {
  description = "AWS availability one B"
  type        = string
}

variable "private_dns_name" {
  description = "My private DNS name"
  type        = string
}

#############  Network  #############
variable "network_address_space" {
  description = "My VPC CIDER"
  type        = string
}
variable "public_subnet1_address_space" {
  description = "My public subnet 1"
  type        = string
}
variable "private_subnet1_address_space" {
  description = "My private subnet 1"
  type        = string
}
variable "public_subnet2_address_space" {
  description = "My public subnet 2"
  type        = string
}
variable "private_subnet2_address_space" {
  description = "My private subnet 2"
  type        = string
}

#############  Route53 Related  ##########
variable "private_hosted_zone_domain" {
  description = "my aws private hosted zone"
  type        = string
}

#############  EKS  #############
variable "kubernetes_version" {
  description = "kubernetes version"
  type        = string
}
variable "cluster_irsa" {
  description = "Enable IRSA for EKS cluster"
  type        = bool
}
variable "server_instance_type" {
  description = "Kubernetes instance type for server nodes"
  type        = string
}
variable "client_instance_type" {
  description = "Kubernetes instance type for client nodes"
  type        = string
}
variable "application_namespace" {
  description = "Namespace name for applications System"
  type        = string
}

#############  Tags Related  #############
variable "asset_owner" {
  description = "Email, preferably distribution list of the project"
  type        = string
}
variable "environment" {
  description = "Environment i.e DEV, QA, PPE, PROD"
  type        = string
}
variable "environment_name" {
  description = "The name of the Environment i.e. Production"
  type        = string
}
variable "owner" {
  description = "Full owner name"
  type        = string
}
variable "project_name" {
  description = "The Name of the Project"
  type        = string
}

variable "eks_userarn" {
  description = "The ARN of the user that you would like to add to aws-auth ConfigMap"
  type        = string
}

variable "eks_username" {
  description = "The username that you would like to add to aws-auth ConfigMap"
  type        = string
}