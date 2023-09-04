Simplified Getting Started Tutorial for Kaniko using Podman

Table of Contents:

Prerequisites
Prepare Kaniko Config Files
Set Up Local Build Context
Create Docker Registry Authentication Secret
Create Kubernetes Resources
Build and Check Logs
Pull and Test the Image
Prerequisites:

A Kubernetes Cluster (Minikube or Cloud Provider).
A DockerHub account for image pushing.
Step 1: Prepare Kaniko Config Files

Prepare the following config files for Kubernetes resources:

pod.yaml: Starts a Kaniko container for image building.
volume.yaml: Creates a persistent volume as the build context.
volume-claim.yaml: Creates a persistent volume claim for the Kaniko container.
Step 2: Set Up Local Build Context

SSH into the cluster and create a local directory for build context. Create a simple Dockerfile in this directory:

bash
Copy code
mkdir kaniko && cd kaniko
echo 'FROM ubi-8' >> dockerfile
echo 'ENTRYPOINT ["/bin/bash", "-c", "echo hello"]' >> dockerfile
cat dockerfile
Copy the path to this directory, as it will be used in the volume.yaml file.

Step 3: Create Docker Registry Authentication Secret

Create a Kubernetes Secret for authentication with your Docker registry:

bash
kubectl create secret docker-registry regcred \
  --docker-server=<your-registry-server> \
  --docker-username=<your-name> \
  --docker-password=<your-pword> \
  --docker-email=<your-email>
Replace placeholders with your actual registry info.

Step 4: Create Kubernetes Resources

Create the necessary resources in Kubernetes:

bash
kubectl create -f volume.yaml
kubectl create -f volume-claim.yaml
kubectl create -f pod.yaml

# Check volume and pod status
kubectl get pv dockerfile
kubectl get pods

Step 5: Build and Check Logs

Check if the volume is mounted correctly, and the build completes:

bash
Copy code
kubectl get pods
kubectl logs kaniko
Step 6: Pull and Test the Image

If the build succeeds, the Kaniko image will be pushed to DockerHub. Pull and run the image locally using Podman:

bash
Copy code
podman run -it <user-name>/<repo-name>
You've successfully completed the Kaniko hello-world example using Podman! Congratulations!