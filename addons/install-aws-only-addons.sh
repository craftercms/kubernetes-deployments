#!/bin/bash

set -e

SCRIPT_HOME=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

if ! command -v helm &> /dev/null
then
    echo "helm is required before any addons are installed"
    exit
fi

echo "------------------------------------------------------------------------"
echo "Installing ALB Ingress Controller"
echo "------------------------------------------------------------------------"

helm repo add eks https://aws.github.io/eks-charts

kubectl apply -k "github.com/aws/eks-charts/stable/aws-load-balancer-controller//crds?ref=master"

helm upgrade aws-load-balancer-controller eks/aws-load-balancer-controller \
  --install \
  --namespace=kube-system \
  --set clusterName=kuber-testing \
  --set serviceAccount.create=false \
  --set serviceAccount.name=aws-load-balancer-controller

echo ""
