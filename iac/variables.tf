variable "docker_image" {
  description = "Docker image to deploy"
  type        = string
  default     = "silvesteranto/webapp:latest"
}

variable "kubeconfig_path" {
  description = "Path to the kubeconfig file"
  type        = string
  default     = "~/.kube/config"
}
