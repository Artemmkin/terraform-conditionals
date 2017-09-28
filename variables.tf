variable public_key_path {
  description = "Public key used for SSH"
  default     = "~/.ssh/appuser"
}

variable "project_id" {
  description = "The ID of the project"
}

variable "region" {
  description = "The Region"
  default     = "europe-west1"
}

variable use_static_ip {
  description = "Use ephemeral or static IP (takes 1 or 0)"
}
