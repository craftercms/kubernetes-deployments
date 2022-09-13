# Crafter CMS Kubernetes Example Deployments

## Pre-requisites

1. Install kubectl
2. Have a Kubernetes cluster available. For testing we recommend `minikube`

If using `minikube`, please do the following:

<!-- - Start `minikube` with a higher `ulimit` (required for Elasticsearch: `minikube start --docker-opt="default-ulimit=nofile=65535:65535"` -->
- Run this command to avoid failing to download the `craftercms/authoring_tomcat` image: `minikube image pull craftercms/authoring_tomcat:4.0.1`

## Deployments

- [Authoring cluster with embedded DB (enterprise only)](authoring/cluster)
- [Simple Authoring with a single instance](authoring/simple)
- [Simple Delivery with 2 instances pulling from an Authoring cluster or a single Authoring](delivery/simple)