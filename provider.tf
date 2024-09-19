provider "google" {
  credentials = file(var.google_credentials)
  project     = var.project_id
  region      = var.region
}
