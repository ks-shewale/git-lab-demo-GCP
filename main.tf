resource "google_compute_network" "vpc_network" {
  name = "gitlab-network"
}

resource "google_compute_firewall" "default" {
  name    = "gitlab-firewall"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "tcp"
    ports    = ["22", "80", "443"]
  }

  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_instance" "gitlab_vm" {
  name         = "gitlab"
  machine_type = "e2-medium"

  tags = ["gitlab"]

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
    }
  }

  network_interface {
    network = google_compute_network.vpc_network.name
    access_config {} # public IP
  }

  metadata_startup_script = file("startup.sh")
}