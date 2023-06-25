
# Terraform

## Remove a resource from terraform state

1. List all state: `terraform state list`
1. Remove desired resource from state: `terraform state rm <name>`

## Create develop environment
terraform workspace new develop

## Destroy develop environment
terraform workspace select develop
terraform destroy

# AWS
## Get the cluster id by using the following command:
aws elasticache describe-cache-clusters --region= (your region)

# [trivy-action](https://github.com/aquasecurity/trivy-action)
Trivy (pronunciation) is a comprehensive and versatile security scanner. Trivy has scanners that look for security issues, and targets where it can find those issues.

# Skaffold
The Skaffold syntax reference can be found here
[https://skaffold.dev/docs/references/yaml/](https://skaffold.dev/docs/references/yaml/)

# Doc
[https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elastic_beanstalk_environment#example-with-options](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elastic_beanstalk_environment#example-with-options)
[https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/command-options-general.html](https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/command-options-general.html)
- [Studying the Kubernetes Ingress system](https://www.joyfulbikeshedding.com/blog/2018-03-26-studying-the-kubernetes-ingress-system.html)
- [Ingress-Nginx Controlle](https://kubernetes.github.io/ingress-nginx/deploy/)
- [How to Install AWS Load Balancer Controller using Terraform Helm Provider](https://blog.devgenius.io/how-to-install-aws-load-balancer-controller-using-terraform-helm-provider-4b4078c69bbf)
- [Deploy Elastic beanstalk in multi-env using terraform](https://medium.com/@aws.kanojia/deploy-elastic-beanstalk-in-multi-env-using-terraform-e79a0a8f613)

