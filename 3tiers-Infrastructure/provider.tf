
# This file is used to configure the provider and backend for the terraform code.
# The provider is the plugin that terraform uses to interact with the cloud provider.

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }


  //use s3 as the backend to store the state file
  backend "s3" {
    bucket = "my-terraform-backen"
    key    = "Dev/terraform.tfstate"
    region = "us-east-1"
  }

}
provider "aws" {
  region = var.region
}
