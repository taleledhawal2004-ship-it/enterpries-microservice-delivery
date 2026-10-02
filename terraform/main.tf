terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}

# Dedicated network
resource "docker_network" "app_network" {
  name = "enterprise_net"
}

# Deploy the Application Container using local image
resource "docker_container" "app_container" {
  name  = "enterprise-production-service"
  image = "enterprise-app:latest"

  networks_advanced {
    name = docker_network.app_network.name
  }

  ports {
    internal = 8080
    external = 8081
  }

  env = [
    "NODE_ENV=production",
    "PORT=8080",
    "APP_VERSION=v1.0.0-terraform"
  ]

  restart = "always"
}