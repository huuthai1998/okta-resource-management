# Feed values into Okta OAuth app's jwks
locals {
  jwks                    = jsondecode(data.jwks_from_key.jwks.jwks)
  admin_role_custom_label = "${var.label} custom role - ${var.env}"
  # queryParams             = split("&", split("?", var.github_repo_url)[1])
  # gh_org                  = element(split("=", local.queryParams[0]), 1)
  # gh_repo                 = element(split("=", local.queryParams[1]), 1)
  org_url            = "https://${var.org_name}.${var.base_url}"
  resource_set_label = "${var.label} resource set - ${var.env}"
}
