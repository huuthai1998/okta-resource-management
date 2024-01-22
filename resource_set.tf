resource "okta_resource_set" "resource_set" {
  label       = var.resources_set_label
  description = var.resources_set_description
  resources   = [format("%s/api/v1/apps/%s", local.org_url, module.okta_api_app.app_id), ]
}
