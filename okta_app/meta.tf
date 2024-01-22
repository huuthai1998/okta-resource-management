# Feed values into Okta OAuth app's jwks
locals {
  jwks = jsondecode(data.jwks_from_key.jwks.jwks)
}