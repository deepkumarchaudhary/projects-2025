output "kubeconfig_path" {  
  value = abspath("kubeconfigs/${var.cluster_name}.yaml")  
}  