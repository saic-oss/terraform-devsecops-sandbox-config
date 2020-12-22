terraform {
  required_providers {
    gitlab = {
      source  = "gitlabhq/gitlab"
      version = "3.1.0"
    }
    jenkins = {
      source  = "taiidani/jenkins"
      version = "0.6.0"
    }
  }
  required_version = "0.13.5"
}
