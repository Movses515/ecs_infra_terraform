terraform {
  required_version = ">= 1.5.0"
  cloud {
    organization = "movses_martirosyan_org"
    workspaces {
      name = "DEV"
    }
  }
}