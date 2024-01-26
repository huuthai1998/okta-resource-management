terraform {
  required_providers {
    okta = {
      source  = "okta/okta"
      version = "~> 4.6.3"
    }
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }
}
