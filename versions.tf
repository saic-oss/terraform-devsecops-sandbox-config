terraform {
  required_version = ">= 0.13.0"

  required_providers {
    gitlab = {
      source  = "gitlabhq/gitlab"
      version = ">= 3.0.0"
    }
    jenkins = {
      source  = "taiidani/jenkins"
      version = ">= 0.6.0"
    }
  }
}
