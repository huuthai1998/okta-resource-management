resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "random_string" "kid" {
  length  = 6
  special = false
}

data "jwks_from_key" "jwks" {
  key = tls_private_key.rsa.private_key_pem
  kid = random_string.kid.result
}

resource "okta_app_oauth" "app" {
  label                      = "${var.label} api app - ${var.env}"
  type                       = "service"
  response_types             = ["token"]
  grant_types                = ["client_credentials"]
  token_endpoint_auth_method = "private_key_jwt"

  jwks {
    kty = local.jwks.kty
    kid = local.jwks.kid
    e   = local.jwks.e
    n   = local.jwks.n
  }
}

resource "okta_app_oauth_api_scope" "app_scope" {
  app_id     = okta_app_oauth.app.client_id
  issuer     = "https://${var.org_name}.${var.base_url}"
  scopes     = ["okta.apps.manage", "okta.roles.manage", "okta.policies.manage", "okta.appGrants.manage"]
  depends_on = [okta_app_oauth.app]
}

