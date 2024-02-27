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
  label                      = "${var.label} testttt app - ${var.env}"
  type                       = var.type
  response_types             = var.response_types
  grant_types                = var.grant_types
  redirect_uris              = var.redirect_uris
  login_uri                  = var.logout_redirect_uris[0]
  post_logout_redirect_uris  = var.logout_redirect_uris
  omit_secret                = var.type != "browser" ? false : true
  token_endpoint_auth_method = var.type != "browser" ? "private_key_jwt" : "none"
  implicit_assignment        = true

  dynamic "jwks" {
    for_each = var.type != "browser" ? [1] : []
    content {
      kty = local.jwks.kty
      kid = local.jwks.kid
      e   = local.jwks.e
      n   = local.jwks.n
    }
  }
}

