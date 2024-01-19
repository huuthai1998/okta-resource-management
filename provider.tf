provider "okta" {
  org_name       = var.org_name
  base_url       = var.base_url
  client_id      = var.client_id
  scopes         = ["okta.apps.manage", "okta.appGrants.manage", "okta.roles.manage", "okta.policies.manage", "okta.groups.manage"]
  private_key    = var.private_key
  private_key_id = var.private_key_id
}
