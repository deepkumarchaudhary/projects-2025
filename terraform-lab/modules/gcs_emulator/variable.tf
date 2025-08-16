variable "bucket_name" {  
  description = "Emulated GCS bucket name"  
  type        = string  
}  

variable "external_port" {  
  description = "Host port for GCS emulator"  
  type        = number  
  default     = 4443  
}  

variable "location" {  
  description = "Bucket location"  
  type        = string  
  default     = "EUROPE-WEST2"  
}  

variable "storage_class" {  
  description = "Bucket storage class"  
  type        = string  
  default     = "STANDARD"  
}  