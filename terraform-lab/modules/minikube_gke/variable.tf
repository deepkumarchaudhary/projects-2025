variable "cluster_name" {  
  description = "Test-Minkuber"  
  type        = string  
  default     = "admiral-gke"  
}  

variable "driver" {  
  description = "Minikube driver (docker, virtualbox, etc)"  
  type        = string  
  default     = "docker"  
}  

variable "k8s_version" {  
  description = "Kubernetes version"  
  type        = string  
  default     = "v1.27.3"  
}  