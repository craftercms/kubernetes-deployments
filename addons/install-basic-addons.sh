#!/bin/bash

set -e

SCRIPT_HOME=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

if ! command -v helm &> /dev/null
then
    echo "helm is required before any addons are installed"
    exit
fi

echo "------------------------------------------------------------------------"
echo "Installing Metrics Server"
echo "------------------------------------------------------------------------"
helm upgrade metrics-server stable/metrics-server \
  --install \
  --version=2.11.1 \
  --namespace=kube-system \
  --values=$SCRIPT_HOME/metrics-server-config.yaml
echo ""
