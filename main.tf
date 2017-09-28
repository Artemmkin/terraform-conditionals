########### DO NOT USE STATIC IP ##############
resource "google_compute_instance" "app_ephemeral" {
  name         = "reddit-app"
  machine_type = "g1-small"
  zone         = "europe-west1-b"
  tags         = ["reddit-app"]

  count = "${1 - var.use_static_ip}"

  boot_disk {
    initialize_params {
      image = "ubuntu-1604-lts"
    }
  }


  network_interface {
    network = "default"

    access_config = {}
  }

  metadata {
    sshKeys = "appuser:${file(var.public_key_path)}"
  }
}

########### USE STATIC IP ##############

resource "google_compute_instance" "app_static" {
  name         = "reddit-app"
  machine_type = "g1-small"
  zone         = "europe-west1-b"
  tags         = ["reddit-app"]
  count = "${var.use_static_ip}"


  boot_disk {
    initialize_params {
      image = "ubuntu-1604-lts"
    }
  }

  network_interface {
    network = "default"

    access_config = {
      nat_ip = "${google_compute_address.app_ip.address}"
    }
  }

  metadata {
    sshKeys = "appuser:${file(var.public_key_path)}"
  }
}

resource "google_compute_address" "app_ip" {
  name = "reddit-app-ip"
  count = "${var.use_static_ip}"
}
