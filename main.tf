terraform {
  backend "remote" {
    organization = "sebastian-p3"
    workspaces {
      name = "aws-tf-learning"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-west-2"
}

resource "aws_s3_bucket" "example" {
    bucket = var.bucket_name
    acl    = "private"

    tags = {
        Name        = "gitops-bucket-sebastian"
        Environment = "Dev"
    }
}

