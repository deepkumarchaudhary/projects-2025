module "gke_cluster" {
  source = "./modules/minikube_gke"
}

output "gke_kubeconfig" {
  value = module.gke_cluster.kubeconfig_path
}