
# GH actions Docker tag
```yml
- name: Generate Docker tag
  id: generate_tag
  run: echo "::set-output name=tag::$(git rev-parse --short HEAD)"
  # run: echo "tag=$(git rev-parse --short HEAD) >> $GITHUB_OUTPUT"

- name: Set Docker tag as environment variable
  run: echo "DOCKER_TAG=${{ steps.generate_tag.outputs.tag }}" >> $GITHUB_ENV
```

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
Trivy is a comprehensive and versatile security scanner. Trivy has scanners that look for security issues, and targets where it can find those issues.

# Skaffold
The Skaffold syntax reference can be found here
[https://skaffold.dev/docs/references/yaml/](https://skaffold.dev/docs/references/yaml/)

# K8s

## Setup NGINX Ingress Controller with Cert-Manager on AWS EKS

1. Add HELM Repository
```bash
helm repo add nginx-stable https://helm.nginx.com/stable
helm repo update
```

2. Install the Nginx Controller
```bash
helm upgrade --install ingress-nginx ingress-nginx \
             --repo https://kubernetes.github.io/ingress-nginx \
             --namespace ingress-nginx --create-namespace
```
Verify the controller is installed

```bash
kubectl get pods -n ingress-nginx
```
The output is similar to

```bash
NAME                                        READY   STATUS      RESTARTS    AGE
ingress-nginx-controller-89758f7c6-swwpf    1/1     Running     0           1m
```
Verify, the LoadBalancer is set up.

```bash
kubectl get services -n ingress-nginx
```

The output is similar to,
```bash
NAME                                 TYPE           CLUSTER-IP       EXTERNAL-IP                                                              PORT(S)                      AGE
ingress-nginx-controller             LoadBalancer   10.100.20.84     a4217761afdb3457683821e38a3d3de7-XXXXXXXXX.us-east-2.elb.amazonaws.com   80:31105/TCP,443:31746/TCP   3d18h
```

# Kubectl

You can switch from local (minikube) to gcloud and back with:

```
kubectl config use-context CONTEXT_NAME
```

to list all contexts:

```
kubectl config get-contexts
```

## Secrets
```
kubectl create secret generic pgpassword --from-literal PGPASSWORD=12345test -n context-name
```

# Doc
[https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elastic_beanstalk_environment#example-with-options](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elastic_beanstalk_environment#example-with-options)
[https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/command-options-general.html](https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/command-options-general.html)
- [Studying the Kubernetes Ingress system](https://www.joyfulbikeshedding.com/blog/2018-03-26-studying-the-kubernetes-ingress-system.html)
- [Ingress-Nginx Controlle](https://kubernetes.github.io/ingress-nginx/deploy/)
- [How to Install AWS Load Balancer Controller using Terraform Helm Provider](https://blog.devgenius.io/how-to-install-aws-load-balancer-controller-using-terraform-helm-provider-4b4078c69bbf)
- [Deploy Elastic beanstalk in multi-env using terraform](https://medium.com/@aws.kanojia/deploy-elastic-beanstalk-in-multi-env-using-terraform-e79a0a8f613)
