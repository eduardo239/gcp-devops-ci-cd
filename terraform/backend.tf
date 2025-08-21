terraform {
  required_version = ">= 1.3.0"
  backend "gcs" {
    bucket = "tf-bucket-ci-cd"
    prefix = "terraform/state"
  }

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}


provider "google" {
  credentials = file(var.credentials_file)
  project     = var.project_id
  region      = var.region

}
