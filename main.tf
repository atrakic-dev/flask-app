locals {
  name   = "flask-app"
  region = "ams3"
}

provider "digitalocean" {}

resource "digitalocean_droplet" "my-docker-server" {
  image  = "ubuntu-18-04-x64"
  region = "ams3"
  size   = "s-1vcpu-1gb"
  ipv6   = true
  name   = format("%s-%s", local.name, local.region)

  provisioner "remote-exec" {
    inline = [
      "export PATH=$PATH:/usr/bin:/usr/local/bin",
      "sudo apt-get update",
      "sudo apt-get dist-upgrade -yy",
      "sudo apt-get -y install git curl sudo",
      "sudo curl -L https://github.com/docker/compose/releases/download/1.24.1/docker-compose-Linux-x86_64 -o /usr/local/bin/docker-compose",
      "sudo chmod +x /usr/local/bin/docker-compose",
      "sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose",
      "git clone -q https://github.com/atrakic-dev/flask-app.git",
      "cd flask-app && sudo docker-compose up -d"
    ]
  }
  tags = ["terraform"]
}

output "hello_world" {
  value = "Hello, ${local.name}"
}

