module "okta_oauth_app" {
  source         = "./oauth_app"
  org_name       = var.org_name
  base_url       = var.base_url
  client_id      = var.client_id
  private_key    = file("./new.key")
  private_key_id = var.private_key_id
  label          = "FE app"
  type           = var.oauth_app_type
  response_types = var.oauth_app_response_types
  grant_types    = var.oauth_app_grant_types
  redirect_uris  = var.redirect_uris
  logout_redirect_uris = var.logout_redirect_uris
}

# module "okta_manager_app" {
#   source         = "./api_app"
#   org_name       = var.org_name
#   base_url       = var.base_url
#   client_id      = var.client_id
#   private_key    = file("./idcOkta.key")
#   private_key_id = var.private_key_id
#   label          = var.label
#   # github_token    = var.github_token
#   # github_repo_url = var.github_repo_url
#   oidc_app_id = module.okta_oauth_app.app_id
# }

# resource "local_sensitive_file" "foo" {
#   content  = module.okta_manager_app.key_private.private_key_pem
#   filename = "./apiApp.key"
# }
