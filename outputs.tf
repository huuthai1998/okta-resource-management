output "api_key_private" {
  sensitive = true
  value     = module.okta_api_app.key_private
}

output "api_key_id" {
  value = module.okta_api_app.key_id
}

output "app_id" {
  value = module.okta_api_app.app_id
}
