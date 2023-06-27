
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
Ideal for productions environments. But there's another reason why you should pick Terraform, and that's `incremental updates`.

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

## Cleanup
To enable image pruning, you can run Skaffold with both --no-prune=false and --cache-artifacts=false:

```bash
skaffold dev --no-prune=false --cache-artifacts=false
```

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

## Deployments
A [Deployment](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/) provides declarative updates for Pods and ReplicaSets.

```yml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
  labels:
    app: nginx
spec:
  replicas: 3
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx:1.14.2
        ports:
        - containerPort: 80
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
Don't forget create secrets in the cluster.
```
kubectl create secret generic pgpassword --from-literal PGPASSWORD=12345test -n context-name
```

# Minikube
run the below command to enable the metrics-server addon. This step ensures metrics collection for your cluster and deployments.

    minikube addons enable metrics-server

# Pulses
[K9S](https://k9scli.io/) has a handy cluster-wide dashboard feature called Pulses, which shows you charts and statistics for deployments, events, pods, etc. Follow the steps in the following paragraphs to know how to monitor your cluster with Pulses.

## [Commands](https://k9scli.io/topics/commands/)
K9s CLI comes with a view arguments that you can use to launch the tool with different configuration.

```bash
# List all available CLI options
k9s help
# Get info about K9s runtime (logs, configs, etc..)
k9s info
# Run K9s in a given namespace.
k9s -n mycoolns
# Run K9s and launch in pod view via the pod command.
k9s -c pod
# Start K9s in a non default KubeConfig context
k9s --context coolCtx
# Start K9s in readonly mode - with all modification commands disabled
k9s --readonly
```

TODO: Check xray https://adamtheautomator.com/k9s-kubernetes/

nslookup
dig

# Doc
[https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elastic_beanstalk_environment#example-with-options](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elastic_beanstalk_environment#example-with-options)
[https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/command-options-general.html](https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/command-options-general.html)
- [Studying the Kubernetes Ingress system](https://www.joyfulbikeshedding.com/blog/2018-03-26-studying-the-kubernetes-ingress-system.html)
- [Ingress-Nginx Controlle](https://kubernetes.github.io/ingress-nginx/deploy/)
- [How to Install AWS Load Balancer Controller using Terraform Helm Provider](https://blog.devgenius.io/how-to-install-aws-load-balancer-controller-using-terraform-helm-provider-4b4078c69bbf)
- [Deploy Elastic beanstalk in multi-env using terraform](https://medium.com/@aws.kanojia/deploy-elastic-beanstalk-in-multi-env-using-terraform-e79a0a8f613)
