# terraform.tfvars
credentials_file_path = "/path/to/key.json"
project_id            = "my-gcp-project-id"
region                = "us-central1"
zone                  = "us-central1-a"
cluster_name          = "my-cluster"
machine_type          = "n1-standard-1"
disk_size_gb          = 100
image                 = "debian-cloud/debian-9"
min_replicas           = 1
max_replicas           = 3
target_size            = 2
