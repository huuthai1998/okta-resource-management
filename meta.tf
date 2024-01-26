# Feed values into Okta OAuth app's jwks
locals {
  org_url = "https://${var.org_name}.${var.base_url}"

  queryParams = split("&", split("?", var.github_repo_url)[1])
  gh_org      = element(split("=", local.queryParams[0]), 1)
  gh_repo     = element(split("=", local.queryParams[1]), 1)

  admin_role_custom_label = "${var.app_base_label} custom role - ${var.env}"
  resource_set_label = "${var.app_base_label} resource set - ${var.env}"
  okta_manager_app_label = "${var.app_base_label} manager app - ${var.env}"
  okta_oauth_app_label = "${var.app_base_label} oauth app - ${var.env}"
}