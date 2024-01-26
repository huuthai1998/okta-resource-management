data "github_repository" "repo" {
  full_name = "${local.gh_org}/${local.gh_repo}"
}

resource "github_repository_environment" "repo_environment" {
  repository       = data.github_repository.repo.name
  environment      = var.env
}

resource "github_actions_environment_secret" "okta_api_app_private_key" {
  repository      = data.github_repository.repo.name
  environment     = var.env
  secret_name     = "OKTA_API_APP_PRIVATE_KEY"
  plaintext_value = module.okta_manager_app.key_private.private_key_pem
  depends_on = [ github_repository_environment.repo_environment ]
}

resource "github_actions_environment_secret" "okta_api_app_key_id" {
  repository      = data.github_repository.repo.name
  environment     = var.env
  secret_name     = "OKTA_API_APP_PRIVATE_KEY_ID"
  plaintext_value = module.okta_manager_app.key_id
  depends_on = [ github_repository_environment.repo_environment ]
}

resource "github_actions_environment_secret" "okta_api_app_id" {
  repository      = data.github_repository.repo.name
  environment     = var.env
  secret_name     = "OKTA_API_APP_ID"
  plaintext_value = module.okta_manager_app.app_id
  depends_on = [ github_repository_environment.repo_environment ]
}
