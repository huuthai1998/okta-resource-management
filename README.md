# Terraform Okta Resource Management

This component is used to create OAuth app, API App, custom admin role, resource sets and link them together.

It creates:

- Okta OAuth App
- Okta API App
- Custom Admin Role
- Resource Set
- Assign API App to resource set
- Assign custom admin role to the resource set and API app

## Run-Book

#### IMPORTANT NOTE

1. TF version is specified in `versions.tf`.
2. Go through `variables.tf` for understanding each terraform variable before running this component.

## Using it in a blueprint

IMPORTANT: We periodically release versions for the components. Since, master branch may have breaking changes, best practice would be to use a released version in form of a tag (e.g. ?ref=x.y.z)

```terraform

module "okta_resource_management" {
  source                    = "./okta_iz_module"
  org_name                  = var.org_name
  base_url                  = var.base_url
  client_id                 = var.client_id
  private_key               = file("new.key")
  private_key_id            = var.private_key_id
  api_app_label             = var.api_app_label
  oauth_app_label           = var.oauth_app_label
  oauth_app_type            = var.oauth_app_type
  oauth_app_response_types  = var.oauth_app_response_types
  oauth_app_grant_types     = var.oauth_app_grant_types
  resources_set_label       = var.resources_set_label
  resources_set_description = var.resources_set_description
  custom_role_label         = var.custom_role_label
  custom_role_description   = var.custom_role_description
  custom_role_permissions   = var.custom_role_permissions
}

```

## Inputs

Some example inputs:

org_name = "orgName"
base_url = "okta.com"
client_id = "yourAppIdHere"
private_key_id = "PrivateKeyIdOfTheApp"

app_label = "IZ App"
app_type = "service"
app_response_types = ["token"]
app_grant_types = ["client_credentials"]

resources_set_label = "TF Resource set IZ"
resources_set_description = "iz set 1 here"
custom_role_label = "TF Role Custom IZ"
custom_role_description = "Custom IZ role desc"
custom_role_permissions = ["okta.apps.assignment.manage", "okta.users.manage", "okta.apps.manage"]

## Outputs

app_id
