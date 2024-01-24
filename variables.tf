# variables for provider
variable "org_name" {
  description = "This is the org name of your Okta account, for example dev-123456.oktapreview.com would have an org name of dev-123456. It must be provided, but it can also be sourced from the OKTA_ORG_NAME environment variable."
  type        = string
}

variable "base_url" {
  description = "This is the domain of your Okta account, for example dev-123456.oktapreview.com would have a base url of oktapreview.com. It must be provided, but it can also be sourced from the OKTA_BASE_URL environment variable."
  type        = string
}

variable "client_id" {
  description = "This is the client ID for obtaining the API token. It can also be sourced from the OKTA_API_CLIENT_ID environment variable."
  type        = string
}

variable "private_key" {
  description = "This is the private key for obtaining the API token (can be represented by a filepath, or the key itself). It can also be sourced from the OKTA_API_PRIVATE_KEY environment variable."
  type        = string
}

variable "private_key_id" {
  description = "This is the private key ID (kid) for obtaining the API token. It can also be sourced from OKTA_API_PRIVATE_KEY_ID environmental variable."
  type        = string
  default     = ""
}

# variables for app

variable "app_base_label" {
  description = "The Application's base name."
  type        = string
}

variable "oauth_app_type" {
  description = "The type of OAuth application. For SPA apps use browser. Valid values: web, native, browser, service."
  type        = string
}

variable "oauth_app_response_types" {
  description = "List of OAuth 2.0 response type strings. The values must be code, token, id_token."
  type        = list(string)
  default     = ["code"]
}

variable "oauth_app_grant_types" {
  description = "List of OAuth 2.0 grant types. Valid values: authorization_code, implicit, password, refresh_token, client_credentials, urn:ietf:params:oauth:grant-type:saml2-bearer (Early Access Property), urn:ietf:params:oauth:grant-type:token-exchange (Early Access Property), interaction_code (OIE only)."
  type        = list(string)
  default     = ["authorization_code"]
}

variable "redirect_uris" {
  description = "List of URIs for use in the redirect-based flow. This is required for all application types except service."
  type        = list(string)
}

variable "custom_role_permissions" {
  description = "The permissions that the new Role grants. At least one permission must be specified when creating custom role. Valid values: okta.authzServers.manage, okta.authzServers.read, okta.apps.assignment.manage, okta.apps.manage, okta.apps.read, okta.customizations.manage, okta.customizations.read, okta.groups.appAssignment.manage, okta.groups.create, okta.groups.manage, okta.groups.members.manage, okta.groups.read, okta.profilesources.import.run, okta.users.appAssignment.manage, okta.users.create, okta.users.credentials.expirePassword, okta.users.credentials.manage, okta.users.credentials.resetFactors, okta.users.credentials.resetPassword, okta.users.groupMembership.manage, okta.users.lifecycle.activate, okta.users.lifecycle.clearSessions, okta.users.lifecycle.deactivate, okta.users.lifecycle.delete, okta.users.lifecycle.manage, okta.users.lifecycle.suspend, okta.users.lifecycle.unlock, okta.users.lifecycle.unsuspend, okta.users.manage, okta.users.read, okta.users.userprofile.manage, okta.workflows.invoke"
  type        = list(string)
}
