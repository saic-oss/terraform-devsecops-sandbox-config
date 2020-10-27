data "terraform_remote_state" "remote_state" {
  backend = "local"
  config = {
    path = "../1-infra/terraform.tfstate"
  }
}

provider "gitlab" {
  token    = data.terraform_remote_state.remote_state.outputs.gitlab_root_user_personal_access_token
  base_url = "${data.terraform_remote_state.remote_state.outputs.gitlab_endpoint}/api/v4/"
}

module "devsecops-sandbox-config" {
  source            = "../../.."
  gitlab_user_count = var.gitlab_user_count
  gitlab_group_name = var.gitlab_group_name
}
