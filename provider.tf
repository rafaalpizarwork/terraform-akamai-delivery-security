terraform {
  required_providers {
    akamai = {
      source  = "akamai/akamai"
      version = ">= 10.0"
    }
  }
  required_version = ">= 1.9.0"
}

provider "akamai" {
  edgerc         = var.edgerc_path
  config_section = var.edgerc_section
}
