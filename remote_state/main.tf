terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "random_string" "prefix" {
  length = 8
  special = false
  upper = false
}

resource "aws_s3_bucket" "example" {
  bucket = "${random_string.prefix.result}-valheim-terraform-state"

  tags = var.tags
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.example.id
  versioning_configuration {
    status = "Enabled"
  }
}