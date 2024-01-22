resource "okta_admin_role_custom" "custom_role" {
  label       = var.custom_role_label
  description = var.custom_role_description
  permissions = var.custom_role_permissions
}

resource "okta_app_oauth_role_assignment" "api_app_role_assignment" {
  client_id    = module.okta_api_app.app_id
  type         = "CUSTOM"
  role         = okta_admin_role_custom.custom_role.id
  resource_set = okta_resource_set.resource_set.id
}
