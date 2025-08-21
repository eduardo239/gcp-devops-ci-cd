resource "random_string" "random_name" {
  length  = 8
  special = false
}

resource "google_compute_instance" "vm_instance" {
  name         = "vm-instance-${random_string.random_name.result}"
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
