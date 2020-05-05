# Crafter CMS Authoring Cluster with embedded DB

Enterprise images are required for running an Authoring cluster with embedded DB

## Start the cluster

1. `cd nodes`
2. Run `kubectl apply -k .`
3. `cd ../arbiter`
4. Run `kubectl apply -k .`

## Update the cluster nodes

1. `cd nodes`
2. Run `kubectl apply -k`. The containers are not automatically terminated.
3. Terminate one container so that a new container with the updated deployment changes is created.
4. Terminate the second container after the first one is ready. A new container is going to be created.

## Shutdown the cluster

1. `cd arbiter`
2. Run `kubectl delete -k .`. Make sure the container has been completely terminated
3. `cd ../nodes`
4. Run `kubectl delete -k . --cascade=false`
5. Terminate one of the containers
6. Make sure the first container has been completely terminated, then terminate the second one
