#!/bin/bash

set -e

echo "Installing base packages..."

sudo apt-get update

sudo apt-get install -y 
curl 
wget 
unzip 
jq 
git 
python3 
python3-pip

echo "Installing Docker..."

curl -fsSL https://get.docker.com | sh

echo "Installing AWS CLI..."

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" 
-o "awscliv2.zip"

unzip awscliv2.zip

sudo ./aws/install

echo "Installing kubectl..."

curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

chmod +x kubectl

sudo mv kubectl /usr/local/bin/

echo "Installing Helm..."

curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

echo "Installing CloudWatch Agent..."

wget https://amazoncloudwatch-agent.s3.amazonaws.com/ubuntu/amd64/latest/amazon-cloudwatch-agent.deb

sudo dpkg -i amazon-cloudwatch-agent.deb
