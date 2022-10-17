# terraform

Azure

az login --use-device-code
az account set --subscription="54d87296-b91a-47cd-93dd-955bd57b3e9a"
az group show --name RG_Terraform_20221017

docker build -t buivantri:v1 docker/
docker run -it -v "/workspace/terraform:/root" buivantri:v1 bash

terraform plan -destroy -out main.destroy.tfplan
terraform apply main.destroy.tfplan

# Gitpod
[![Open in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/#https://github.com/buivantri1198/terraform)
