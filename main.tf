terraform {
  required_version = ">= 0.12.10"
  backend "remote" {
    organization = "xomodo"
    workspaces {
      name = "flask-app"
    }
  }
}

output "hello" {
  value = "World"
}
