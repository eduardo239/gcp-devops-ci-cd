resource "google_project_service" "project_services" {
  for_each           = toset(var.services)
  project            = var.project_id
  service            = each.value
  disable_on_destroy = false
}

resource "random_string" "suffix" {
  length  = 6
  special = false
  upper   = false

}

resource "google_compute_instance" "vm_instance" {
  name         = "vm-instance-1"
  project      = var.project_id
  machine_type = "e2-micro"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }
}


resource "google_storage_bucket" "bucket" {
  name          = "tf-bucket-${random_string.suffix.result}"
  location      = var.region
  force_destroy = true

  uniform_bucket_level_access = true

  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = false
  }
}

module "vpc" {
  source                   = "../modules/vpc"
  network_name             = var.vpc_name
  routing_mode             = "REGIONAL"
  region                   = var.region
  private_ip_google_access = true
  subnets = [
    {
      name          = "subnet-1"
      ip_cidr_range = "10.0.1.0/24"
    },
    {
      name          = "subnet-2"
      ip_cidr_range = "10.0.2.0/24"
    }
  ]
}
