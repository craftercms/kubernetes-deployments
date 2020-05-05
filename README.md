# Crafter CMS Kubernetes Example Deployments

## Pre-requisites

1. Install eksctl
2. Install Helm 3

## Create a simple EKS cluster with a single worker node

`eksctl create cluster -f cluster.yaml`

## Install ALB ingress controller

```
helm upgrade alb-ingress-controller incubator/aws-alb-ingress-controller \
  --install \
  --version=0.1.13\
  --namespace=kube-system \
  --values=alb-ingress-config.yaml
```

## Deployments

- [Authoring cluster with embedded DB (enterprise only)](authoring/cluster)
- [Simple Authoring with a single instance](authoring/simple)
- [Simple Delivery with 2 instances pulling from an Authoring cluster or a single Authoring](delivery/simple)