resource "docker_container" "gcs_emulator" {  
  name  = "gcs-emulator-${var.bucket_name}"  
  image = "fsouza/fake-gcs-server:latest"  
  ports {  
    internal = 4443  
    external = var.external_port  
  }  
  command = ["-scheme", "http", "-public-host", "localhost:${var.external_port}"]  

  # Create empty file to simulate bucket  
  provisioner "local-exec" {  
    command = "mkdir -p buckets/${var.bucket_name} && touch buckets/${var.bucket_name}/.placeholder"  
  }  
}  

resource "local_file" "bucket_metadata" {  
  filename = "buckets/${var.bucket_name}/metadata.json"  
  content  = jsonencode({  
    name         = var.bucket_name  
    location     = var.location  
    storageClass = var.storage_class  
    created      = timestamp()  
  })  
}  