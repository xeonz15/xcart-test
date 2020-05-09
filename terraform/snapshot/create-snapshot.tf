# 

variable "digitalocean_token" {}

# Configure the Digital Ocean Provider
provider "digitalocean" {
  token = var.digitalocean_token
}

data "digitalocean_droplet" "node1" {
  name = "lon1-xcart1"
}

resource "digitalocean_droplet_snapshot" "node1-snapshot" {
  droplet_id = data.digitalocean_droplet.node1.id
  name       = "xcart-snapshot-01"
}
