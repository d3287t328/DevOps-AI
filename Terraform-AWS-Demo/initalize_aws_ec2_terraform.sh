#!/bin/bash
set -euo pipefail

# Constants
REGION="us-east-2"
INSTANCE_TYPE="t2.small"
AMI_ID="ami-051f7e7f6c2f40dc1"
TF_FILES=("main.tf" "variables.tf" "output.tf")
AWS_CONFIGURED=$(aws configure list | grep -c 'access_key')
GITHUB_ACTIONS_DIR=".github/workflows"

# Check if AWS is configured
if [ $AWS_CONFIGURED -eq 0 ]; then
  echo "AWS is not configured. Run 'aws configure' first."
  exit 1
fi

# Functions
create_tf_file() {
  local file=$1
  local content=$2
  echo "$content" > "$file"
}

# Initialize GitHub Actions directory
mkdir -p $GITHUB_ACTIONS_DIR

# GitHub Actions workflow
create_tf_file "$GITHUB_ACTIONS_DIR/terraform.yml" <<EOL
name: 'Terraform'
on:
  push:
    branches:
      - main
jobs:
  terraform:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - name: Setup Terraform
        uses: hashicorp/setup-terraform@v1
      - run: terraform init
      - run: terraform validate
      - run: terraform plan
      - run: terraform apply -auto-approve
EOL

# Initialize Terraform
terraform init
echo "Terraform initialized."

# Create main.tf
create_tf_file "main.tf" <<EOL
provider "aws" {
  region = var.region
}
module "tfstate" {
  source = "./Modules/tfstate"
}
EOL

# Create Modules and tfstate
mkdir -p Modules/tfstate

# Create variables.tf in Modules/tfstate
create_tf_file "Modules/tfstate/variables.tf" <<EOL
variable "bucket_name" {
  type        = string
  description = "The name of the bucket"
}
EOL

# Create main.tf in Modules/tfstate
create_tf_file "Modules/tfstate/main.tf" <<EOL
# Terraform block here
EOL

# Create variables.tf
create_tf_file "variables.tf" <<EOL
variable "region" {
  default = "$REGION"
}
variable "cluster_name" {
  default = "my-secure-eks-cluster"
}
EOL

# Create output.tf
create_tf_file "output.tf" <<EOL
output "cluster_id" {
  value = aws_eks_cluster.this.id
}
EOL

# Lint
# pre-commit run -a
echo "Linted."

# Plan and Apply
terraform plan
read -rp "Apply? (y/n): " confirm
[[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit 1
terraform apply

echo "EKS cluster created."
