locals {
  enabled = var.enabled == "true" ? true : false
  name    = "flask-app"
}

variable "enabled" {
  description = "Set to false to prevent the module from creating any resources"
  default     = "true"
}

provider "digitalocean" {}

resource "digitalocean_droplet" "docker-compose-server" {
  count     = local.enabled == true ? 1 : 0
  image     = "ubuntu-18-04-x64"
  region    = "ams3"
  size      = "s-1vcpu-1gb"
  ipv6      = true
  name      = format("%s-%d", local.name, count.index)
  ssh_keys  = [25624561]
  user_data = file("${path.module}/userdata.sh")
  tags      = ["terraform"]
}
