resource "okta_admin_role_custom" "custom_role" {
  label       = "${var.app_base_label} Custom Role"
  description = "Custom Role for ${var.app_base_label}"
  permissions = var.custom_role_permissions
}

resource "okta_app_oauth_role_assignment" "api_app_role_assignment" {
  client_id    = module.okta_api_app.app_id
  type         = "CUSTOM"
  role         = okta_admin_role_custom.custom_role.id
  resource_set = okta_resource_set.resource_set.id
}
