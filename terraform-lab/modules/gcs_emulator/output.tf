output "endpoint" {  
  value = "http://localhost:${var.external_port}/storage/v1"  
}  

output "bucket_path" {  
  value = abspath("buckets/${var.bucket_name}")  
}  