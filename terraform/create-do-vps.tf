# main.tf

variable "digitalocean_token" {}

# Configure the Digital Ocean Provider
provider "digitalocean" {
  token = var.digitalocean_token
}

#  Resources
## Create a new ssh key
resource "digitalocean_ssh_key" "default" {
  name       = "jenkins ssh key"
  public_key = file("~/.ssh/id_rsa.pub")
}

## Create a new Digital Ocean Droplet using the SSH key
resource "digitalocean_droplet" "node1" {
  name     = "lon1-xcart1"
  image    = "centos-7-x64"
  size     = "s-1vcpu-2gb"
  region   = "lon1"
  ssh_keys = [digitalocean_ssh_key.default.fingerprint]
}

output "instance_ip_addr" {
  value       = digitalocean_droplet.node1.ipv4_address
  description = "The public IP address of the main server instance."
}

