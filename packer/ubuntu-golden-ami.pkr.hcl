packer {
required_plugins {
amazon = {
source  = "github.com/hashicorp/amazon"
version = "~> 1.3"
}
}
}

# =========================================================

# VARIABLES

# =========================================================

variable "aws_region" {
type    = string
default = "ap-southeast-1"
}

variable "project_name" {
type    = string
default = "ggg-observability-platform"
}

variable "environment" {
type    = string
default = "lab"
}

# =========================================================

# SOURCE AMI

# =========================================================

source "amazon-ebs" "ubuntu" {

region        = var.aws_region

instance_type = "t3.medium"

ssh_username  = "ubuntu"

ami_name        = "${var.project_name}-ubuntu2404-{{timestamp}}"
ami_description = "GGG Observability Platform Golden AMI"

encrypt_boot = true

source_ami_filter {

```
filters = {
  name                = "ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"
  root-device-type    = "ebs"
  virtualization-type = "hvm"
}

owners = [
  "099720109477"
]

most_recent = true
```

}

tags = {
Name        = "${var.project_name}-ami"
Project     = var.project_name
Environment = var.environment
ManagedBy   = "packer"
Owner       = "Rodzon"
Repository  = "ggg-observability-platform"
}
}

# =========================================================

# BUILD

# =========================================================

build {

sources = [
"source.amazon-ebs.ubuntu"
]

provisioner "shell" {
script = "install-tools.sh"
}

provisioner "shell" {
script = "validate-tools.sh"
}

post-processor "manifest" {
output = "manifest.json"
}
}
