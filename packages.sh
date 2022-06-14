#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

#
# DEBIAN PACKAGES
#
apt-get update 
apt upgrade -y
apt install git vim zsh neofetch rsync python-pip python-dev -y 

#
# AWS CLI
#
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
rm awscliv2.zip

#
# VERSIONS OF TERRAFORM
#
for TVER in 1.2.2 1.0.0
do
    TF="terraform_${TVER}_linux_amd64.zip"
    URL="https://releases.hashicorp.com/terraform/${TVER}/${TF}"
    wget $URL
    unzip $TF
    chmod +x terraform
    mv -v terraform "/usr/local/bin/terraform_${TVER}"
    rm -v $TF
done

ln -s /usr/local/bin/terraform_1.2.2 /usr/local/bin/terraform

#
# VERSIONS OF KUBECTL
#
for KVER in 1.24.0 1.20.0
do
    KURL="https://dl.k8s.io/release/v${KVER}/bin/linux/amd64/kubectl"
    curl -LO $KURL
    chmod +x kubectl
    mv kubectl "/usr/local/bin/kubectl_${KVER}"
done

ln -s /usr/local/bin/kubectl_1.24.0 /usr/local/bin/kubectl

#
# ANSIBLE
#

# pip install ansible==2.3.3.0
# pip install ansible==2.9
