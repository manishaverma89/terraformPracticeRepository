terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.95.0"
    }
    random = {
      source = "hashicorp/random"
      version = "3.7.2"
    }
  }
}


provider "aws" {
    region = "us-east-1"
}
