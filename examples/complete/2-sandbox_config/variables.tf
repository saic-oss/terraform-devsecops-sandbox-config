variable "gitlab_user_count" {
  type        = number
  description = "Number of users to create. Must be at least 1"
}

variable "gitlab_group_name" {
  description = "Name to use for new GitLab group."
  type        = string
  validation {
    condition     = can(regex("^[a-z0-9]+[a-z0-9\\-]*[a-z0-9]+$", var.gitlab_group_name))
    error_message = "Invalid group name. May only contain lowercase letters, numbers, and the (-) symbol, and cannot begin or end with (-)."
  }
}
