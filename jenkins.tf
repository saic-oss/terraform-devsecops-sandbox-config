resource "jenkins_job" "demo" {
  name     = gitlab_project.demo.name
  template = file("${path.module}/examples/complete/2-sandbox_config/job.xml")

  parameters = {
    credentials = "gitlab-credentials"
    description = "Job to run pipeline for ${gitlab_project.demo.name}"
    name        = gitlab_project.demo.name
    repository  = gitlab_project.demo.import_url
    scriptPath  = "Jenkinsfile"
  }
}
