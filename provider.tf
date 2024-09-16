# provider.tf
provider "google" {
 # credentials = file(var.credentials_file_path)  # Path to your GCP service account JSON key
  project     = var.project_id                   # GCP Project ID
  region      = var.region                       # Region to deploy the resources
}
