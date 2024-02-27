# org_name       = "dev-63222668"
# base_url       = "okta.com"
# client_id      = "0oaez9nacbBuZnCSN5d7"
# private_key_id = ""

label = "DemoOkta"

oauth_app_response_types = ["code"]
oauth_app_grant_types    = ["authorization_code"]

custom_role_permissions = ["okta.apps.assignment.manage", "okta.users.manage", "okta.apps.manage", "okta.group.manage", "okta.policies.mange"]
redirect_uris           = ["http://localhost:8080/login/callback"]
logout_redirect_uris    = ["http://localhost:8080"]
