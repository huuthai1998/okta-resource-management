# Terraform Okta OAuth App

This component is used to create OAuth app.

It creates:

- Okta OAuth App
- Private and Public key used for the app
- Resource Set that contains OAuth App

## Run-Book

#### IMPORTANT NOTE

1. TF version is specified in `versions.tf`.
2. Go through `variables.tf` for understanding each terraform variable before running this component.

## Using it in a blueprint

IMPORTANT: We periodically release versions for the components. Since, master branch may have breaking changes, best practice would be to use a released version in form of a tag (e.g. ?ref=x.y.z)

```terraform

module "okta_app" {
  source         = "./module"
  org_name       = var.org_name
  base_url       = var.base_url
  client_id      = var.client_id
  private_key    = var.private_key
  private_key    = file("new.key")
  private_key_id = var.private_key_id
  label          = var.label
  type           = var.type
  response_types = var.response_types
  grant_types    = var.grant_types
}
```

## Outputs

key_private

key_id
