# Crafter CMS Authoring Cluster with embedded DB

Enterprise images are required for running an Authoring cluster with embedded DB

## Start the cluster

1. `cd nodes`
2. Run `kubectl apply -k .`
3. `cd ../arbiter`
4. Run `kubectl apply -k .`

## Update the cluster nodes

**IMPORTANT:** These steps are mainly for making minor configuration updates. If you need to upgrade the Crafter CMS
images to a new version, please follow the *Upgrade to a new version of Crafter CMS* section

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

## Upgrade to a new version of Crafter CMS

1. Scale the Arbiter Deployment to 0, by updating the `spec.replicas` in the `arbiter/arbiter-deployment.yaml` and 
doing `kubectl apply -k .`. Make sure the `arbiter` pod is terminated.
2. Scale the Authoring StatefulSet to 1, by updating the `spec.replicas` in the `nodes/authoring-deployment.yaml` and 
doing `kubectl apply -k .`. Make sure the `authoring-1` (second pod) is terminated. If not, kill it. Only
`authoring-0` should be running now.
3. Change the image tags to the new Crafter CMS version in the YAML files.
4. Upgrade `nodes/resources/config/studio` configuration files to their new versions.
5. `cd nodes` and run `kubectl apply -k .` (make sure `spec.replicas` is still 1, it's important that `authoring-1` is 
NOT started since it's our backup in case the upgrade goes wrong). If the `authoring-0` pod is not automatically 
terminated, terminate it. `authoring-0` should be restarted.
6. Watch the log of `authoring_tomcat` container of the `authoring-0` pod for upgrade manager errors.
7. If the upgrade manager fails:
    1. Save the `/opt/crafter/data`, the `/opt/crafter/logs` and the container log of the `authoring_tomcat` container.
    You can use these later for troubleshooting.
    2. Scale the Authoring StatefulSet to 0. No Authoring pod should be running.
    3. Delete the `data-authoring-0` pvc (Persistent Volume Claim). `authoring-0` will start with no data.
    4. Scale the Authoring StatefulSet to 2. `authoring-1` will bootstrap the cluster with the data previous to the 
    upgrade and `authoring-0` will replicate it.
8. If the upgrade manager finished successfully, you can now scale the Authoring StatefulSet back to 2 so `authoring-1`
replicates the upgrade.
9. Scale the Arbiter Deployment back to 1.
