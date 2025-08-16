resource "docker_container" "k8s_emulator" {
  name  = "k8s-emulator"
  image = "kindest/node:v1.27.3"
  ports {
    internal = 6443
    external = 16443
  }
}

# Create kubeconfig directory
resource "null_resource" "create_kubeconfig_dir" {
  provisioner "local-exec" {
    command = "mkdir -p ${path.module}/kubeconfigs"
  }
}

# Generate kubeconfig from template
resource "local_file" "kubeconfig" {
  depends_on = [null_resource.create_kubeconfig_dir]
  
  filename = "${path.module}/kubeconfigs/${var.cluster_name}.yaml"
  content = templatefile("${path.module}/kubeconfig.tpl", {
    cluster_name = var.cluster_name
  })
}

resource "local_file" "cluster_info" {
  filename = "${path.module}/clusters/${var.cluster_name}.json"
  content = jsonencode({
    name       = var.cluster_name
    status     = "RUNNING"
    endpoint   = "https://localhost:16443"
    created_at = timestamp()
  })
}