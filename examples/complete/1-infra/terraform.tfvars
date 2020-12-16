region                            = "us-east-1"
namespace                         = "example"
stage                             = "test"
name                              = "terraform-devsecops-sandbox-config"
controlplane_instance_type        = "t3a.medium"
worker_instance_type              = "t3a.large"
master_cluster_kubernetes_version = "v1.18.9-rancher1-1"
worker_cluster_kubernetes_version = "v1.18.9-rancher1-1"
node_volume_size                  = "50"
availability_zones                = ["us-east-1a", "us-east-1b", "us-east-1c"]
subdomain_rancher_prefix          = "rancher"
additional_tag_map                = {}
letsencrypt_environment           = "production"
enable_detailed_monitoring        = false
worker_min_size                   = 3
worker_max_size                   = 3
worker_desired_capacity           = 3
protect_from_scale_in             = false
jenkins_admin_email               = "jenkinsadmin@example.com"
