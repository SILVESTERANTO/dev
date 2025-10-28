output "deployment_name" {
  description = "The name of the Kubernetes deployment"
  value       = kubernetes_deployment.webapp.metadata[0].name
}

output "service_name" {
  description = "The name of the Kubernetes service"
  value       = kubernetes_service.webapp_service.metadata[0].name
}

output "service_node_port" {
  description = "The NodePort assigned to the service"
  value       = kubernetes_service.webapp_service.spec[0].port[0].node_port
}
