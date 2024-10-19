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
  region                   = "ap-southeast-1" # Singapore
  profile                  = "default"
  shared_config_files      = ["~/.aws/config"]
  shared_credentials_files = ["~/.aws/credentials"]
}
