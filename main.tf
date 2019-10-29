variable "enabled" {
  description = "Set to false to prevent the module from creating any resources"
  default     = "false"
}

locals {
  enabled  = var.enabled == "true" ? true : false
  name     = "flask-app"
  ssh_keys = [25624561]
  image    = "ubuntu-18-04-x64"
  region   = "ams3"
  size     = "s-1vcpu-1gb"
}

provider "digitalocean" {}

resource "digitalocean_droplet" "docker-compose-server" {
  count     = local.enabled == true ? 1 : 0
  image     = local.image
  region    = local.region
  size      = local.size
  ipv6      = true
  name      = format("%s-%d", local.name, count.index)
  ssh_keys  = local.ssh_keys
  user_data = file("${path.module}/userdata.sh")
  tags      = ["terraform"]
}
