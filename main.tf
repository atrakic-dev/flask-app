terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "xomodo"

    workspaces {
      name = "flask-app"
    }
  }
}
