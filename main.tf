locals {
  name     = "flask-app"
  region   = "ams3"
  ssh_keys = var.ssh_keys
}

variable "ssh_keys" {
  description = "Obtain your ssh_key id number via your account: https://developers.digitalocean.com/documentation/v2/#list-all-key"
  type        = list(string)
}

provider "digitalocean" {}

resource "digitalocean_droplet" "docker-compose-server" {
  image     = "ubuntu-18-04-x64"
  region    = "ams3"
  size      = "s-1vcpu-1gb"
  ipv6      = true
  name      = format("%s-%s", local.name, local.region)
  ssh_keys  = local.ssh_keys
  user_data = file("${path.module}/userdata.sh")
  tags      = ["terraform"]
}

output "hello_world" {
  value = "Hello, ${local.name}"
}

