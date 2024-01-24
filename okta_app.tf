module "okta_api_app" {
  source         = "./okta_app"
  org_name       = var.org_name
  base_url       = var.base_url
  client_id      = var.client_id
  api_scopes     = ["okta.apps.manage", "okta.roles.manage"]
  private_key    = var.private_key
  private_key_id = var.private_key_id
  label          = "${var.app_base_label} Api App"
  type           = "service"
  response_types = ["token"]
  grant_types    = ["client_credentials"]
}

module "okta_oauth_app" {
  source         = "./okta_app"
  org_name       = var.org_name
  base_url       = var.base_url
  client_id      = var.client_id
  api_scopes     = ["okta.apps.manage", "okta.roles.manage"]
  private_key    = var.private_key
  private_key_id = var.private_key_id
  label          = "${var.app_base_label} OAuth App"
  type           = var.oauth_app_type
  response_types = var.oauth_app_response_types
  grant_types    = var.oauth_app_grant_types
  redirect_uris  = var.redirect_uris
}
