variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = "fa1-app"
}

variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "frontend_port" {
  description = "External frontend port"
  type        = number
}

variable "backend_port" {
  description = "External backend port"
  type        = number
}