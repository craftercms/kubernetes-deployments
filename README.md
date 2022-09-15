# Crafter CMS Kubernetes Example Deployments

## Pre-requisites

1. Install kubectl
2. Have a Kubernetes cluster available. For testing the Simple Authoring and Simple Delivery you can used any cluster. If using `minikube`, please do the following:

- Run this command to avoid failing to download the `craftercms/authoring_tomcat` image: `minikube image pull craftercms/authoring_tomcat:4.0.2-SNAPSHOT`

For the Authoring cluster example, you will need and AWS EKS cluster with the AWS Load Balancer Controller installed: https://docs.aws.amazon.com/eks/latest/userguide/aws-load-balancer-controller.html.

## Deployments

- [Authoring cluster (enterprise only)](authoring/cluster)
- [Simple Authoring with a single instance](authoring/simple)
- [Simple Delivery with 2 instances pulling from an Authoring cluster or a single Authoring](delivery/simple)