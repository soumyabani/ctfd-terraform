terraform {
  required_providers {
    ctfd = {
      source = "ctfer-io/ctfd"
      version = "2.6.0"
    }
  }
}

provider "ctfd" {
  # Configuration options
  url     = var.ctfd_url
  api_key = var.ctfd_token
}
