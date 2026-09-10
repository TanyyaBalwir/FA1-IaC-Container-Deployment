output "frontend_url" {
  value = "http://localhost:${var.frontend_port}"
}

output "backend_url" {
  value = "http://localhost:${var.backend_port}"
}

output "environment" {
  value = var.environment
}