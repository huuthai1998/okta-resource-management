module "okta_app" {
  source         = "../okta_app"
  org_name       = var.org_name
  base_url       = var.base_url
  client_id      = var.client_id
  private_key    = var.private_key
  private_key_id = var.private_key_id
  label          = var.app_label
  type           = var.app_type
  response_types = var.app_response_types
  grant_types    = var.app_grant_types
}
