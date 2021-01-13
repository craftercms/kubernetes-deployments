#!/bin/bash

set -e

echo "------------------------------------------------------------------------"
echo "Installing Metrics Server"
echo "------------------------------------------------------------------------"
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
echo ""
