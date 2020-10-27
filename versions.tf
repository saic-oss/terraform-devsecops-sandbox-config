terraform {
  required_version = ">= 0.13.0, < 0.14.0"

  required_providers {
    gitlab = {
      source  = "gitlabhq/gitlab"
      version = ">= 3.0.0, < 4.0.0"
    }
  }
}
