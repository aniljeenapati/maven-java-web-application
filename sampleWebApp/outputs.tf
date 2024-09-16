output "cluster_endpoint" {
  description = "Endpoint of the GKE cluster"
  value       = google_container_cluster.primary.endpoint
}

output "client_certificate" {
  description = "Client certificate for GKE cluster"
  value       = google_container_cluster.primary.master_auth[0].client_certificate
}

output "client_key" {
  description = "Client key for GKE cluster"
  value       = google_container_cluster.primary.master_auth[0].client_key
}

output "cluster_ca_certificate" {
  description = "CA certificate for GKE cluster"
  value       = google_container_cluster.primary.master_auth[0].cluster_ca_certificate
}
