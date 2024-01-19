# Feed values into Okta OAuth app's jwks
locals {
  org_url = "https://${var.org_name}.${var.base_url}"
}