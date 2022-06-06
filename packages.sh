#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

#
# DEBIAN PACKAGES
#
apt-get update 
apt upgrade -y
apt install git vim zsh neofetch rsync -y 

# wget https://releases.hashicorp.com/terraform/1.2.2/terraform_1.2.2_linux_amd64.zip 
# unzip terraform*.zip 
# chmod +x terraform 
# mv terraform /usr/local/bin/terraform
# rm terraform*.zip

#
# AWS CLI
#
url "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
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
# PIPINST="get-pip.py"

# if [[ -f $PIPINST ]]; then
#   echo "$PIPINST exists"
# else
#   echo "$PIPINST does not exist"
#   curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
#   python3 get-pip.py --user
# fi

# PATHSTR='export PATH=$PATH:'${HOME}'/.local/bin'

# case `grep -Fx "$PATHSTR" "${HOME}/.bashrc" >/dev/null; echo $?` in
#   0)
#     # code if found
#     echo "path found"
#     ;;
#   1)
#     # code if not found
#     echo "not there"
#     echo "export PATH=\$PATH:${HOME}/.local/bin" >> ~/.bashrc
#     ;;
#   *)
#     # code if an error occurred
#     echo "error trying to find path string in .bashrc"
#     exit 1
#     ;;
# esac

# source ~/.bashrc
# pip install virtualenv

# python3 -m virtualenv ansible
# source ansible/bin/activate