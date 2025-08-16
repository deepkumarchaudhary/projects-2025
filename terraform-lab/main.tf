module "gcs_bucket" {  
  source       = "./modules/gcs_emulator"  
  bucket_name  = "test-bucket-${random_pet.suffix.id}"  
  external_port = 4443  
}  

module "gke_cluster" {  
  source      = "./modules/gke_emulator"  
  cluster_name = "test-cluster-${random_pet.suffix.id}"  
}  

resource "random_pet" "suffix" {  
  length = 1  
}  

output "gcs_endpoint" {  
  value = module.gcs_bucket.endpoint  
}  

output "gke_kubeconfig" {  
  value = module.gke_cluster.kubeconfig_path  
}  