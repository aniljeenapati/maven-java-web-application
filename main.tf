resource "google_container_cluster" "primary" {
  name     = var.cluster_name
  location = var.region

  remove_default_node_pool = true
  min_master_version       = "1.21.9-gke.2100"  // Adjust as needed

  node_config {
    machine_type = var.node_machine_type
  }
}

resource "google_container_node_pool" "primary_nodes" {
  name       = "${google_container_cluster.primary.name}-node-pool"
  location   = var.region
  cluster    = google_container_cluster.primary.name
  node_count = var.node_count

  node_config {
    machine_type = var.node_machine_type
  }
}

output "kubeconfig" {
  description = "The kubeconfig file contents"
  value       = google_container_cluster.primary.endpoint
}

output "cluster_name" {
  description = "The name of the Kubernetes cluster"
  value       = google_container_cluster.primary.name
}

output "cluster_endpoint" {
  description = "The endpoint of the Kubernetes cluster"
  value       = google_container_cluster.primary.endpoint
}
