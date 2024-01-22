provider "okta" {
  org_name       = var.org_name
  base_url       = var.base_url
  client_id      = var.client_id
  scopes         = ["okta.policies.manage", "okta.appGrants.manage", "okta.apps.manage"]
  private_key    = var.private_key
  private_key_id = var.private_key_id
}
