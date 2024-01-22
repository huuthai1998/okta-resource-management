output "key_private" {
  sensitive = true
  value     = tls_private_key.rsa
}

output "key_id" {
  sensitive = true
  value     = random_string.kid
}

output "app_id" {
  value = okta_app_oauth.app.id
}
