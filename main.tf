resource "google_container_cluster" "primary" {
  name     = var.cluster_name
  location = var.region

  initial_node_count = var.node_count  // Set the initial node count here

  node_config {
    machine_type = var.node_machine_type
  }

  remove_default_node_pool = false  // Keep the default node pool since you're not creating a custom one
  min_master_version       = "1.21.9-gke.2100"  // Adjust as needed
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
