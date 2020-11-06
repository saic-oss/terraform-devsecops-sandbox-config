resource "random_password" "user_passwords" {
  count       = var.gitlab_user_count
  length      = 12
  upper       = true
  min_upper   = 1
  lower       = true
  min_lower   = 1
  number      = true
  min_numeric = 1
  special     = false
}

resource "gitlab_user" "users" {
  count             = var.gitlab_user_count
  email             = "sandboxuser${count.index + 1}@example.com"
  name              = "Sandbox User ${count.index + 1}"
  password          = random_password.user_passwords[count.index].result
  username          = "sandboxuser${count.index + 1}"
  can_create_group  = false
  is_admin          = false
  is_external       = true
  skip_confirmation = true
}

resource "gitlab_group" "configurable_group" {
  name = var.gitlab_group_name
  path = var.gitlab_group_name
}

resource "gitlab_group_membership" "sandbox_user_memberships" {
  count        = var.gitlab_user_count
  access_level = "developer"
  group_id     = gitlab_group.configurable_group.id
  user_id      = gitlab_user.users[count.index].id
}

resource "gitlab_project" "venus-demo" {
  name                                             = "venus-demo"
  namespace_id                                     = gitlab_group.configurable_group.id
  description                                      = "Modern web application with DevSecOps pipeline"
  visibility_level                                 = "private"
  default_branch                                   = "master"
  issues_enabled                                   = true
  merge_requests_enabled                           = true
  only_allow_merge_if_pipeline_succeeds            = true
  only_allow_merge_if_all_discussions_are_resolved = true
  pipelines_enabled                                = true
  import_url                                       = "https://github.com/saic-oss/venus-demo.git"
  approvals_before_merge                           = 1
  container_registry_enabled                       = true
  lfs_enabled                                      = true
  shared_runners_enabled                           = false
}
