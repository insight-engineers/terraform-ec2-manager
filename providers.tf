terraform {
  required_version = ">= 1.1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.72.0"
    }
  }
}

# Run terraform init to download the provider plugin
# Run aws configure to set up the AWS CLI
# Change the region to your preferred region
provider "aws" {
  region                   = var.aws_region
  shared_config_files      = var.aws_shared_config_files
  shared_credentials_files = var.aws_shared_credentials_files
  profile                  = var.aws_profile
}
