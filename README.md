# Terraform Project for Deploying AWS EKS
This is a take-home project for SRIN application.

## Architecture
What this project do:
1. Create a cluster with name `eks-cluster-ariza`
1. `eks-cluster-ariza` will have 2 nodes. And in case of autoscaling, the number of nodes is guaranteed to be between 1 and 3.


## Generating KUBECONFIG
Execute these commands:
```
terraform output -raw kubeconfig > kubeconfig.yaml
export KUBECONFIG=$(pwd)/kubeconfig.yaml
```
It will:
1. retrieve `kubeconfig.yaml`
1. set `KUBECONFIG` to reference `kubeconfig.yaml`

Now the k8s cluster can be accessed with `kubectl`