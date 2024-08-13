<h1>Sample DevOpsChallenge#1</h1>

<h2>Development environment</h2>

- Download the repository via git: git clone in the **/myapp/app folder**    
- Create a Dockerfile to build the repository
- Create a folder for nginx and configure the reverse proxy. **/myapp/nginx folder**
- Define an nginx Dockerfile
- Create the docker-compose.yml file with the two services
(The nginx service could also be defined directly in docker-compose, but you need the Dockerfile to get our image for the next step)
- Run: <pre><code>docker-compose up </pre></code>
- Service exposed on http://localhost:82

<h2>Kubernetes resource</h2>

- Create docker images via docker-compose with specific configurations (keep in mind the container and host Ports)
- Save the name of the two images (docker images | grep ...)
- Create the Deployment with the 2 containers. **/kubernetes folder**
- Create the NodePort Service to open a port on the node (in this case my PC) and forward requests to the container where nginx runs. (service.yaml)

Useful command: 

<pre><code> kubectl create service nodeport service --clusterip="None" -o yaml --dry-run=client > service.yaml</pre></code>

***
Tested locally via Docker Desktop, you can use minikube, rancher-desktop ...
***

- (Optional) Configure the helm version of this app. Helm a package manger for kubernetes allow us to easily manage the app lifecyle.  **/myapp/helm folder**
    - Define in a tempalte folder the Kubernetes resources with specific Values
    - Define the values.yaml file (Variables)
    - Test the Helm project: helm template app app/ --values app/values 
    - Install the Project: helm install app 
    - Service Expose at: http://localhost:30007

<h2>Deployment</h2>

- Create Terraform folder **/terraform folder**
- Create two module ecr and codebuild
    - ecr  **/terraform/ecr folder**
    - codebuild **/terraform/codebuild folder**
- Create dev-env folder to link the tf modules and specific variables **/terraform/dev-env folder**

- Run the codebuild deployment as a result 
    - Install kubectl and helm bin
    - Build, tag and push docker images to ECR
    - Copy the config file to grant access to a K8S cluster 
    - Install the Chart with HELM in a K8S cluster (config file)
**Optionally even the Helm Chart could be pushed to a repository (ECR or S3)**

***
NB: Codebuild must have some permission to interact with AWS services: 
- S3 for artifcat or logs 
- Cloudwatch for logs 
- ECR to pull/push image
- Codebuild itself to run build and report
***

