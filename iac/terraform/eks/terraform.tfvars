# ------------------------------------------------------------------------------
# Variables
# Version: 1.0.0
# ------------------------------------------------------------------------------

## AWS account data
# aws_region = "ap-southeast-2"
# aws_cli_profile = "terraform-deploy"

###  VPC Related

availablity_zone_a            = "ap-southeast-2a"
availablity_zone_b            = "ap-southeast-2b"
private_dns_name              = "exampleapp.internal"
network_address_space         = "10.0.0.0/21"
public_subnet1_address_space  = "10.0.0.0/24"
private_subnet1_address_space = "10.0.2.0/23"
public_subnet2_address_space  = "10.0.1.0/24"
private_subnet2_address_space = "10.0.4.0/23"

###  Route53 Related

private_hosted_zone_domain = "exampleapp.int"

###  AWS EKS

kubernetes_version    = "1.25"
cluster_irsa          = true
server_instance_type  = "t2.micro"
client_instance_type  = "t2.micro"
application_namespace = "applications"
eks_userarn           = "arn:aws:iam::605313441167:user/terraform-deploy-nz"
eks_username          = "terraform-deploy-nz"

###  Tags Related

environment_name = "exampleapp-production"
owner            = "Pablo Magro"
project_name     = "exampleapp"
asset_owner      = "pmagas.develop@gmail.com"
environment      = "production"
