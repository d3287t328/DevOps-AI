#!/bin/bash
set -euo pipefail

# Constants
REGION="us-east-2"
INSTANCE_TYPE="t2.small"
AMI_ID="ami-051f7e7f6c2f40dc1"
TF_FILES=("main.tf" "variables.tf" "output.tf")

# Functions
create_tf_file() {
  local file=$1
  local content=$2
  echo "$content" > "$file"
}

# Initialize Terraform
terraform init
echo "Terraform initialized."

# Create main.tf
create_tf_file "main.tf" <<EOL
provider "aws" {
  region = var.region
}

resource "aws_eks_cluster" "this" {
  name = var.cluster_name
  enabled_cluster_log_types = ["api", "audit"]
}
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
pre-commit run -a
echo "Linted."

# Plan and Apply
terraform plan
read -rp "Apply? (y/n): " confirm
[[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit 1
terraform apply

echo "EKS cluster created."
