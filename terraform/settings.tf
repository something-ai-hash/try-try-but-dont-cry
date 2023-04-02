provider "aws" {
  region = "ap-south-1"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }
  }
}

terraform {
  backend "s3" {
    bucket = "terraform-bucket-poc-let-us-try"
    key    = "poc/terraform.tfstate"
    region = "ap-south-1"
  }
}

