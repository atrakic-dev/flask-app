terraform {
  backend "remote" {
    organization = "xomodo"
    workspaces {
      name = "flask-app"
    }
  }
}
