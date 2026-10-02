output "container_id" {
  description = "Deployed Docker container ID"
  value       = docker_container.app_container.id
}

output "application_endpoint" {
  description = "Application Live Access URL"
  value       = "http://localhost:8081"
}

output "health_endpoint" {
  description = "Application Healthcheck URL"
  value       = "http://localhost:8081/health"
}