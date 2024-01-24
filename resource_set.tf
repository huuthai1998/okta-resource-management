resource "okta_resource_set" "resource_set" {
  label       = "${var.app_base_label} Resource Set"
  description = "Resource set for ${var.app_base_label}"
  resources   = [format("%s/api/v1/apps/%s", local.org_url, module.okta_api_app.app_id), ]
}
