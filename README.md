# terraform-aks-cluster-provision
In this solution I'm demonstrating how to deploy Azure Kubernetes Service using Terraform.

# Getting Started
- Make sure you have Azure CLI and Terraform CLI installed
- using Azure CLI create Azure Service Principal account: 
  - az ad sp create-for-rbac --name ServicePrincipalAksProvision --skip-assignment
- export the following environment variables, filling in the values of appID and Password from the previous command: 
  - TF_VAR_appId
  - TF_VAR_appPassword
- Download this Git Repo: 
  - git clone https://github.com/HovhannesHovakimyan/terraform-aks-provision.git
- And deploy the provided terraform solution
