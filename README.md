# P41-Devops-Challenge-Senior-Level

## CHALLENGE

You must use either Terraform, AWS CloudFormation, AWS CDK, or Pulumi for all of the following tasks.

Create code for deploying a VPC in AWS with 2 public and 2 private subnets.

Create code for deploying an EKS cluster in AWS, which will use the VPC created in the previous step. The cluster must have 2 nodes, using instance type ```t3a.large```. The nodes must be on the private subnets only.

Add a ```README.md``` to the root directory of your project, with instructions for the team to deploy the infrastructure you created.

Publish your code to a public Git repository in a platform of your choice (e.g. GitHub, GitLab, Bitbucket, etc.), so that it can be cloned by the team.


## Criteria


Your task will be considered successful if a colleague is able to deploy your infrastructure to an AWS account.

Imagine that someone with less experience than you will need to clone your repository and deploy your infrastructure. With that in mind, you must provide all the instructions they will need to do that successfully. These must include any prerequisites for deployment; mention of needed tools and links to their installation pages; how to configure credentials for the tool of your choice; and what commands to run for deploying your code to AWS.

We want to see your ability to properly document and communicate about your work with the team.

Other criteria for evaluation will be:

Code quality and style: your code must be easy for others to read, and properly documented when relevant



# SOLUTION

## Setup and Configuration

We will need Terraform and AWS CLI installed and configured to deploy our Infrastructure. We will be using [Terraform v1.0.2](https://releases.hashicorp.com/terraform/1.0.2/) and [AWS CLI v2.2.33](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html).

After AWS CLI installed we need to configure it with AWS. Make sure you have ```Access key ID``` and ```Secret Access key``` ready with you.

```shell
aws configure

AWS Access Key ID [None]: <Your-Access Key ID>
AWS Secret Access Key [None]: <Ypur-Secret Access Key>
Default region name [None]: us-east-1
Default output format [None]: json
```

## Clone this repo

``` shell
git clone https://github.com/Ameya14/P41-Devops-Challenge-Senior-Level
```

## Deployment

Once everything installed and configured correctly we can then run our Terraform scripts to deploy our VPC and EKS on AWS. Terraform deployment happens with 3 commands:

```shell

cd P41-Devops-Challenge-Senior-Level

# Installs the required provider plugin
terraform init 

# Create a plan of the resources that will be created, updated or destroyed
terraform plan

# Executes the plan and deploy the resources
terraform apply -auto-approve

```

After running these commands wait for few minutes as it will take some time to create all the resources in AWS.

Once deployment completed you can check the status of the resources by running this commands:
``` shell

# To check VPCs 
aws ec2 describe-vpcs

# To check Subnets
aws ec2 describe-subnets

# To check EKS cluster
aws eks describe-cluster --name <your-cluster-name>

# To check EKS cluster node group
aws eks describe-nodegroup --cluster-name <your-cluster-name> --nodegroup-name <your-cluster-nodegroup-name>

```

You can configure your cluster with Kubernetes CLI and check the details of nodes by using these commands:

```shell

# To configure your cluster
aws eks update-kubeconfig --name <your-cluster-name>

# You can use this command to check if the private subnet IP address is set to our nodes by comparing the Internal IP with our private subnet IP address range
kubectl get nodes -o wide

```

## Configuration Changes

You can set your own configuration or variable data in the ``` variables.tf ``` file and then deploy the scripts.

## Destroying

Run ``` terraform destroy -auto-approve ``` after you are done using the resources.
