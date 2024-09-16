# variables.tf
variable "credentials_file_path" {
  description = "Path to the GCP service account key file"
  type        = string
}

variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
}

variable "zone" {
  description = "GCP zone"
  type        = string
}

variable "cluster_name" {
  description = "Name of the Kubernetes cluster"
  type        = string
}

variable "machine_type" {
  description = "Machine type for the nodes"
  type        = string
  default     = "n1-standard-1"
}

variable "disk_size_gb" {
  description = "Disk size for the VM instances"
  type        = number
  default     = 100
}

variable "image" {
  description = "Image to use for the instance template"
  type        = string
}

variable "min_replicas" {
  description = "Minimum number of replicas"
  type        = number
}

variable "max_replicas" {
  description = "Maximum number of replicas"
  type        = number
}

variable "target_size" {
  description = "Target size of the instance group"
  type        = number
}
