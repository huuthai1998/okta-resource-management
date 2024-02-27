resource "okta_admin_role_custom" "custom_role" {
  label       = local.admin_role_custom_label
  description = "Custom Role for ${var.label}"
  permissions = var.custom_role_permissions
}

resource "okta_app_oauth_role_assignment" "api_app_role_assignment" {
  client_id    = okta_app_oauth.app.id
  type         = "CUSTOM"
  role         = okta_admin_role_custom.custom_role.id
  resource_set = okta_resource_set.resource_set.id
}
