terraform {
  required_version = ">= 1.5.0"
  cloud {
    organization = "movses_martirosyan_org"
    workspaces {
      name = "DEV"
    }
  }
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "6.0.1"
}