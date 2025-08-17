output "kubeconfig_path" {
  value = local_file.kubeconfig_file.filename
}

output "cluster_name" {
  value = "admiral-gke"
}