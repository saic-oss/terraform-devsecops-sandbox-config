locals {
  template_file_init = templatefile("examples/complete/3-jenkins_config/job.xml", {
    job_name        = "${gitlab_project.venus-demo.name}"
    job_description = "Job for the Venus demo"
    repository      = "${data.terraform_remote_state.remote_state.outputs.gitlab_endpoint}/${var.gitlab_group_name}/${gitlab_project.venus-demo.name}.git"
    credentials     = "gitlab_credentials"
    script_path     = "Jenkinsfile"
  })
}

resource "null_resource" "add_jenkins_job" {
  triggers = {
    uuid = uuid()
  }
  provisioner "local-exec" {
    command = "./examples/complete/3-jenkins_config/create-job.sh"
    environment = {
      GITLAB_TOKEN     = data.terraform_remote_state.remote_state.outputs.gitlab_root_user_personal_access_token
      JENKINS_ENDPOINT = data.terraform_remote_state.remote_state.outputs.jenkins_endpoint
      JENKINS_JOB_FILE = local.template_file_init
      JOB_NAME         = gitlab_project.venus-demo.name
    }
  }
}
