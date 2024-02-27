resource "okta_resource_set" "resource_set" {
  label       = local.resource_set_label
  description = "Resource set for ${var.label}"
  resources   = [format("%s/api/v1/apps/%s", local.org_url, var.oidc_app_id), ]
}
