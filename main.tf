# main.tf
resource "google_container_cluster" "primary" {
  name     = var.cluster_name
  location = var.region

  node_config {
    machine_type = var.machine_type
    oauth_scopes  = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }

  initial_node_count = 1
}

resource "google_container_node_pool" "primary_nodes" {
  name       = "primary-node-pool"
  location   = var.region
  cluster    = google_container_cluster.primary.name
  node_config {
    machine_type = var.machine_type
    disk_size_gb = var.disk_size_gb
    oauth_scopes  = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
  initial_node_count = 1
}

resource "google_compute_instance_group_manager" "node_pool_mig" {
  name               = "${var.cluster_name}-mig"
  zone               = var.zone
  version {
    instance_template = google_compute_instance_template.instance_template.id
  }
  base_instance_name = "${var.cluster_name}-instance"
  target_size        = var.target_size
}

resource "google_compute_instance_template" "instance_template" {
  name_prefix = "${var.cluster_name}-template"
  machine_type = var.machine_type
  disk {
    auto_delete = true
    boot        = true
    initialize_params {
      image = var.image  # Boot disk image
    }
  }
  network_interface {
    network = "default"
    access_config {
      // Include this block to create an external IP address
    }
  }
}

resource "google_compute_autoscaler" "autoscaler" {
  name   = "${var.cluster_name}-autoscaler"
  zone   = var.zone
  target = google_compute_instance_group_manager.node_pool_mig.id

  autoscaling_policy {
    min_num_replicas = var.min_replicas
    max_num_replicas = var.max_replicas
  }
}
