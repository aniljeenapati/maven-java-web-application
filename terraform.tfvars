# terraform.tfvars
credentials_file_path = "key.json"
project_id            = "kube-435112"
region                = "us-central1"
zone                  = "us-central1-b"
cluster_name          = "my-cluster"
machine_type          = "n1-standard-1"
disk_size_gb          = 10
image                 = "debian-cloud/debian-10"
min_replicas           = 1
max_replicas           = 3
target_size            = 2
