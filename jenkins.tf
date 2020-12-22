resource "jenkins_job" "demo" {
  name     = gitlab_project.demo.name
  template = file("${path.module}/examples/complete/2-sandbox_config/job.xml")

  parameters = {
    credentials = "gitlab_credentials"
    description = "Job to run pipeline for ${gitlab_project.demo.name}"
    name        = gitlab_project.demo.name
    repository  = "${var.gitlab_endpoint}/${var.gitlab_group_name}/${gitlab_project.demo.name}.git"
    scriptPath  = "Jenkinsfile"
  }
}
