#!/bin/bash

CLUSTER_NAME="747590-eks-exampleapp-production"
AWS_REGION="ap-southeast-2" # eg: "ap-southeast-2"

# Update or generate the kubeconfig
# export AWS_PROFILE=k8s-deployer

# Check IAM entity
aws sts get-caller-identity

aws eks update-kubeconfig --region $AWS_REGION --name $CLUSTER_NAME

# Issue:  https://github.com/aws/aws-cli/issues/6920
# sed -e 's/v1beta1/v1alpha1/g' ~/.kube/config > ~/.kube/config.change

# Copy kubeconfig file content to the clipboard.
# cat $HOME/.kube/config | base64 | xclip -selection clipboard

# Update the value of the KUBECONFIG variable in GitHub with the new kubeconfig file.
gh secret set KUBE_CONFIG_DATA --body "$(cat $HOME/.kube/config | base64)"
gh secret set KUBE_CONFIG --body "$(cat $HOME/.kube/config | base64)"

# To confirm that the kubeconfig file is updated
# kubectl config view --minify

# To confirm that your IAM entity is authenticated and that you can access your EKS cluster, run the following command:
# kubectl get svc -n applications

# How to read all *.yaml files from the EKS_deployments_yaml folder and create a new yaml file with the contents of all *.yaml files using the bash cli