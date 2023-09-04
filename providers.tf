terraform {
  backend "s3" {
    bucket                  = "interads-directive-tf-state"
    key                     = "unifi-controller/terraform.tfstate"
    region                  = "ap-southeast-1"
    dynamodb_table          = "terraform-state-locking"
    encrypt                 = true
    shared_credentials_file = "~/.aws/credentials"
  }

  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region                   = "ap-southeast-1"
  shared_credentials_files = ["~/.aws/credentials"]
}