resource "okta_admin_role_custom" "custom_role" {
  label       = var.custom_role_label
  description = var.custom_role_description
  permissions = var.custom_role_permissions
}
