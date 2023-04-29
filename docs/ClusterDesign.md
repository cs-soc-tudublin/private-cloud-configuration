# Cluster Design for CS++ IAAS

## Standardized application development.

This will be achieved using a Kubernetes cluster that will manage the following:
* CI/CD via Tekton. 
* Github automation using Prow
* Docker for deployment.

All repos in the CS++ org should follow this standard and have CI configured for their applications  as they see fit. This will allow for maintainers within the committee to observe the direction the society's bespoke software is going in.

## Linux environment for all.
All society members should be given an environment for them to be able to learn about Linux. The current plan to implement this is using a general-purpose container with compilers, interpreters and other development tools, deployed as a replica set in Kubernetes.
### There are a few ways this can be achieved:
* Exposing members to Kubernetes via cluster roles and, namespaces. This will allow users to kick off their own pods and tekton pipelines, and exec into running pods.
* Running OpenSSH within the containers and allowing users to SSH into the containers. 
