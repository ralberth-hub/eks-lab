terraform {
  required_version = "1.5.2"

  backend "s3" {
    region         = "ap-southeast-1"
    bucket         = "rc-terraform-statefiles"
    key            = "aws-infra-states.tfstate"
    encrypt        = true
    dynamodb_table = "aws-infra"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.39.0"
    }
  }
}