resource "okta_resource_set" "resource_set" {
  label       = var.resources_set_label
  description = var.resources_set_description
  resources   = [format("%s/api/v1/apps/%s", local.org_url, module.okta_app.app_id), ]
}

resource "okta_app_oauth_role_assignment" "iz_app_role_assignment" {
  client_id    = module.okta_app.app_id
  type         = "CUSTOM"
  role         = okta_admin_role_custom.custom_role.id
  resource_set = okta_resource_set.resource_set.id
}
