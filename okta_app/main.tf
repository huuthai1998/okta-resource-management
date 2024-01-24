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
  label          = var.label
  type           = var.type
  response_types = var.response_types
  grant_types    = var.grant_types
  redirect_uris  = var.redirect_uris

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
  scopes     = var.api_scopes
  depends_on = [okta_app_oauth.app]
}

