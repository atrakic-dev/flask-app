variable "name" {
  default = "flask-app"
}

output "hello_world" {
  value = "Hello, ${var.name}"
}
