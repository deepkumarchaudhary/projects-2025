resource "docker_container" "k8s_emulator" {  
  name  = "k8s-emulator"  
  image = "kindest/node:v1.27.3"  
  ports {  
    internal = 6443  
    external = 16443  
  }  

  # Generate kubeconfig  
  provisioner "local-exec" {  
    command = <<-EOT  
      mkdir -p kubeconfigs  
      echo 'apiVersion: v1  
      clusters:  
      - cluster:  
          server: https://localhost:16443  
        name: kind  
      contexts:  
      - context:  
          cluster: kind  
          user: kind  
        name: kind  
      current-context: kind  
      kind: Config  
      preferences: {}  
      users:  
      - name: kind  
        user: {}' > kubeconfigs/${var.cluster_name}.yaml  
    EOT  
  }  
}  

resource "local_file" "cluster_info" {  
  filename = "clusters/${var.cluster_name}.json"  
  content  = jsonencode({  
    name       = var.cluster_name  
    status     = "RUNNING"  
    endpoint   = "https://localhost:16443"  
    created_at = timestamp()  
  })  
}  