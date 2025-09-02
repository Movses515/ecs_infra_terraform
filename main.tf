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
  source  = "./modules/vpc"
}

module "ecs" {
  source = "./modules/ecs"

  vpc_id             = module.vpc.vpc_id
  private_subnets = module.vpc.private_subnets
  public_subnets  = module.vpc.public_subnets
}