# Configure the AWS provider
provider "aws" {
  region = "us-east-1" 
}

# Define required provider and Terraform version
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  required_version = ">= 1.3"
}
