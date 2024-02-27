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
}

variable "env" {
  description = "The environment Okta resources should belong to."
  type        = string
  validation {
    condition     = contains(["DEV", "UAT", "PROD"], var.env)
    error_message = "Environment must be DEV, UAT or PROD."
  }
  default = "DEV"
}

# variable "github_repo_url" {
#   description = "The repository where the function app code will reside."
#   type        = string
#   default     = ""
# }

# variable "github_token" {
#   description = "The Github token of NT"
#   type        = string
# }

# variables for app
variable "label" {
  description = "The Application's display name."
  type        = string
}


variable "custom_role_permissions" {
  description = "The permissions that the new Role grants. At least one permission must be specified when creating custom role. Valid values: okta.authzServers.manage, okta.authzServers.read, okta.apps.assignment.manage, okta.apps.manage, okta.apps.read, okta.customizations.manage, okta.customizations.read, okta.groups.appAssignment.manage, okta.groups.create, okta.groups.manage, okta.groups.members.manage, okta.groups.read, okta.profilesources.import.run, okta.users.appAssignment.manage, okta.users.create, okta.users.credentials.expirePassword, okta.users.credentials.manage, okta.users.credentials.resetFactors, okta.users.credentials.resetPassword, okta.users.groupMembership.manage, okta.users.lifecycle.activate, okta.users.lifecycle.clearSessions, okta.users.lifecycle.deactivate, okta.users.lifecycle.delete, okta.users.lifecycle.manage, okta.users.lifecycle.suspend, okta.users.lifecycle.unlock, okta.users.lifecycle.unsuspend, okta.users.manage, okta.users.read, okta.users.userprofile.manage, okta.workflows.invoke"
  type        = list(string)
  default     = ["okta.apps.assignment.manage", "okta.users.manage", "okta.apps.manage"]
}

variable "oidc_app_id" {
  description = "ID of the OIDC app to place in resource set"
  type        = string
}
