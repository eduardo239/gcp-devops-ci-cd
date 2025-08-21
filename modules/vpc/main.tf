resource "google_compute_network" "vpc_network" {
  name                    = var.vpc_name
  project                 = var.project_id
  auto_create_subnetworks = false
  routing_mode            = var.routing_mode

  lifecycle {
    # prevent_destroy = true
  }
}

resource "google_compute_subnetwork" "vpc_subnetwork" {
  count         = length(var.subnets)
  name          = var.vpc_subnetwork_name
  ip_cidr_range = var.subnets[count.index].ip_cidr_range
  region        = var.region
  network       = google_compute_network.vpc_network.id
  #   depends_on    = [google_compute_network.vpc_network]
  private_ip_google_access = var.private_ip_google_access
}
