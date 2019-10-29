locals {
  name     = "flask-app"
  region   = "ams3"
}

provider "digitalocean" {}

resource "digitalocean_droplet" "docker-compose-server" {
  image     = "ubuntu-18-04-x64"
  region    = "ams3"
  size      = "s-1vcpu-1gb"
  ipv6      = true
  name      = format("%s-%s", local.name, local.region)
  ssh_keys  = [25624561]
  user_data = file("${path.module}/userdata.sh")
  tags      = ["terraform"]
}

output "hello_world" {
  value = "Hello, ${local.name}"
}

