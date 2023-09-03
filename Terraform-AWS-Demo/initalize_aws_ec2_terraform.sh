#!/bin/bash
set -euo pipefail

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
  default = "us-east-2"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "ami_id" {
  default = "ami-051f7e7f6c2f40dc1"
}
EOL

create_tf_file "output.tf" <<EOL
output "instance_id" {
  value = aws_instance.example.id
}
EOL

# echo "Linting."
# pre-commit run -a

echo "Terraform plan."
terraform plan

read -rp "Apply? (yes/no): " confirm
[[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit 1
terraform apply

echo "EC2 instance created."

# Uncomment the following lines to destroy the created resource
# read -rp "Destroy? (yes/no): " confirm_destroy
# [[ $confirm_destroy == [yY] || $confirm_destroy == [yY][eE][sS] ]] || exit 1
# terraform destroy
