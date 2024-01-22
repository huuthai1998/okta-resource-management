terraform {
  required_providers {
    okta = {
      source  = "okta/okta"
      version = "~> 4.6.3"
    }
    tls = {
      source = "hashicorp/tls"
    }
    jwks = {
      source = "iwarapter/jwks"
    }
  }
}
