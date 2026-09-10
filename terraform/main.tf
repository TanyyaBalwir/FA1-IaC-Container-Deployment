terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {}

resource "docker_network" "app_network" {
  name = "${var.project_name}-${var.environment}-network"
}

resource "docker_image" "backend" {
  name = "${var.project_name}-backend:${var.environment}"

  build {
    context    = "../docker/backend"
    dockerfile = "Dockerfile"
  }
}

resource "docker_image" "frontend" {
  name = "${var.project_name}-frontend:${var.environment}"

  build {
    context    = "../docker/frontend"
    dockerfile = "Dockerfile"
  }
}

resource "docker_container" "backend" {
  name  = "${var.project_name}-${var.environment}-backend"
  image = docker_image.backend.image_id

  networks_advanced {
    name = docker_network.app_network.name
  }

  env = [
    "ENVIRONMENT=${var.environment}"
  ]

  ports {
    internal = 5000
    external = var.backend_port
  }
}

resource "docker_container" "frontend" {
  name  = "${var.project_name}-${var.environment}-frontend"
  image = docker_image.frontend.image_id

  networks_advanced {
    name = docker_network.app_network.name
  }

  ports {
    internal = 80
    external = var.frontend_port
  }
}