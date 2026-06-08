#!/bin/bash

set -e

echo "Validating Docker..."
docker --version

echo "Validating kubectl..."
kubectl version --client

echo "Validating Helm..."
helm version

echo "Validating AWS CLI..."
aws --version

echo "Validating Python..."
python3 --version

echo "Validating Git..."
git --version

echo "Validating jq..."
jq --version

echo "Validation Successful"
