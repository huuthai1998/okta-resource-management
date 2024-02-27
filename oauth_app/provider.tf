provider "okta" {
  org_name       = var.org_name
  base_url       = var.base_url
  client_id      = "0oac51oy3q0GDjlk01d7"
  scopes         = ["okta.policies.manage", "okta.appGrants.manage", "okta.apps.manage", "okta.roles.manage", "okta.groups.manage"]
  private_key    = var.private_key
  private_key_id = var.private_key_id
}
