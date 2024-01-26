resource "okta_resource_set" "resource_set" {
  label       = local.resource_set_label
  description = "Resource set for ${var.app_base_label}"
  resources   = [format("%s/api/v1/apps/%s", local.org_url, module.okta_manager_app.app_id), ]
}
