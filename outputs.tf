output "gitlab_user_credentials" {
  description = "Map of Gitlab usernames and passwords"
  value       = zipmap(gitlab_user.users.*.username, random_password.user_passwords.*.result)
  sensitive   = true
}
