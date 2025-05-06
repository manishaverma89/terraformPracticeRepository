terraform {
backend "s3" {
    bucket = "mytf-demobucket-123"
    key = "terraform.tfstate"
    region = "us-east-1"
}
}

provider "aws" {
    region = "us-east-1"
}

