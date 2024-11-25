# Projet : Cloud computing 
API written by Fabien HUITELEC and declarative code of infrastructure (Microsoft Azure) using HCL Terraform.

## Project Description
This project involves provisioning a cloud infrastructure on Microsoft Azure and deploying a Python-based API using the FastAPI framework. Additionally, it includes a CI/CD pipeline configured with GitHub Actions for automated testing, building, and deployment.

## Working group
The whole project has been developed by four contributors:
- Félix Dehandschoewercker 
- Axel Guy
- Maxime Burckel

## Technologies used
- Terraform by HashiCorp `v1.9.0`
- Python `>=3.12`
- FastAPI `>=0.115.0`
- Uvicorn `>=0.22.0`
- Azure CLI `v2.66+`
- PostgreSQL
- Docker

## Project structure
The repository is organized into the following directories:
- `.github`: contains the CI/CD declaration
- `examples`: contains the API written in Python using FastAPI framework
- `infrastructure`: contains the cloud architecture declarations
- `test`: contains, as the name suggests, unit tests for API endpoints 

### Requirements
- HashiCorp Terraform `v1.9.0+`: [Install Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
- Azure CLI `v2.66+`: [Install Azure CLI](https://learn.microsoft.com/fr-fr/cli/azure/install-azure-cli)
- Docker: [Install Docker](https://docs.docker.com/get-docker/)

## Known Issues
- /quotes not working due to permissions issues 

### Directives to run the project
1. Clone this repository on your machine
2. Go into /infrastructure and paste the environment variables
3. Exec 'terraform plan -var-file="secret.tfvars" '
4. terraform apply -var-file="secret.tfvars" 