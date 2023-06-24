# Remove a resource from terraform state

1. List all state: `terraform state list`
1. Remove desired resource from state: `terraform state rm <name>`

# Create develop env:
terraform workspace new develop

# Destroy develop env:
terraform workspace select develop
terraform destroy

# Get the cluster id by using the following command:
aws elasticache describe-cache-clusters --region= (your region)

# Doc
https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elastic_beanstalk_environment#example-with-options
https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/command-options-general.html