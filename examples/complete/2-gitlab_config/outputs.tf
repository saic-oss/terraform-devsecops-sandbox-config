output "gitlab_user_credentials" {
  description = "Map of GitLab usernames and passwords"
  value       = module.devsecops-sandbox-config.gitlab_user_credentials
  sensitive   = true
}
