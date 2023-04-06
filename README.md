# Crafter CMS Kubernetes Example Deployments

## Pre-requisites

1. Install kubectl
2. Have a Kubernetes cluster available. For testing the Simple Authoring and Simple Delivery you can used any cluster. If using `minikube`, please run the following commands, to avoid `context deadline exceeded` errors:

- `minikube image pull craftercms/authoring_tomcat:4.0.3`
- `minikube image pull craftercms/delivery_tomcat:4.0.3`
- `minikube image pull docker.elastic.co/elasticsearch/elasticsearch:7.17.1`

For the Authoring cluster example, you will need and AWS EKS cluster with the AWS Load Balancer Controller installed: https://docs.aws.amazon.com/eks/latest/userguide/aws-load-balancer-controller.html.

3. Create the `craftercms` namespace: `kubectl create namespace craftercms`

## Deployments

- [Authoring cluster (enterprise only)](authoring/cluster)
- [Simple Authoring with a single instance](authoring/simple)
- [Simple Delivery with 2 instances pulling from an Authoring cluster or a single Authoring](delivery/simple)