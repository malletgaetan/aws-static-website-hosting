terraform {
  cloud {
    organization = "malletgaetan"
    workspaces {
      name = "aws-static-website-hosting"
    }
  }
}

provider "aws" {
  region = "eu-west-3"
}

provider "aws" {
  alias  = "acm_provider"
  region = "us-east-1"
}