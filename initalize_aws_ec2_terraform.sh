#!/bin/bash
set -euo pipefail

REGION="us-east-2"
INSTANCE_TYPE="t2.micro"
AMI_ID="ami-051f7e7f6c2f40dc1"

echo "Initializing Terraform."
terraform init

create_tf_file() {
  echo "$2" > "$1"
}

create_tf_file "main.tf" <<EOL
provider "aws" {
  region = var.region
}

resource "aws_instance" "example" {
  ami           = var.ami_id
  instance_type = var.instance_type
}
EOL

create_tf_file "variables.tf" <<EOL
variable "region" {
  default = "$REGION"
}

variable "instance_type" {
  default = "$INSTANCE_TYPE"
}

variable "ami_id" {
  default = "$AMI_ID"
}
EOL

create_tf_file "output.tf" <<EOL
output "instance_id" {
  value = aws_instance.example.id
}
EOL

echo "Linting."
pre-commit run -a

echo "Terraform plan."
terraform plan

read -rp "Apply? (yes/no): " confirm
[[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit 1
terraform apply

echo "EC2 instance created."
