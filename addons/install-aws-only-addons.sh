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
helm upgrade alb-ingress-controller incubator/aws-alb-ingress-controller \
  --install \
  --version=1.0.2 \
  --namespace=default \
  --values=$SCRIPT_HOME/alb-ingress-config.yaml
echo ""
