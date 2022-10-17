# terraform

Azure

apt update
apt install curl wget
apt-get update && apt-get install -y gnupg software-properties-common
wget -O- https://apt.releases.hashicorp.com/gpg | \
    gpg --dearmor | \
    tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
    https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
    tee /etc/apt/sources.list.d/hashicorp.list
apt-get update && apt-get install terraform

az login --use-device-code
az 
az account set --subscription="54d87296-b91a-47cd-93dd-955bd57b3e9a"
az group show --name RG_Terraform_20221017


docker run -it -v "/workspace/terraform:/root" buivantri:v1 bash

# Gitpod
[![Open in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/#https://github.com/buivantri1198/terraform)
