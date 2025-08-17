data "local_file" "existing_kubeconfig" {
  filename = pathexpand("~/.kube/config")  # Use existing kubeconfig
}

# Changed resource name to kubeconfig_file
resource "local_file" "kubeconfig_file" {
  filename = "${path.module}/kubeconfig.yaml"
  content  = data.local_file.existing_kubeconfig.content
}

resource "local_file" "cluster_info" {
  filename = "${path.module}/cluster.json"
  content = jsonencode({
    name       = "admiral-gke"
    status     = "READY"
    endpoint   = "https://localhost:6443"
    version    = "v1.27.3"
    created_at = timestamp()
  })
}