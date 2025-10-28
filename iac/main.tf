terraform {
  required_version = ">= 1.0"
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.20.0"
    }
  }
}

provider "kubernetes" {
  config_path = var.kubeconfig_path
}

resource "kubernetes_deployment" "webapp" {
  metadata {
    name      = "webapp-deployment"
    namespace = "default"
  }

  spec {
    replicas = 2
    selector {
      match_labels = {
        app = "webapp"
      }
    }

    template {
      metadata {
        labels = {
          app = "webapp"
        }
      }

      spec {
        container {
          name  = "webapp-container"
          image = var.docker_image

          port {
            container_port = 80
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "webapp_service" {
  metadata {
    name      = "webapp-service"
    namespace = "default"
  }

  spec {
    selector = {
      app = "webapp"
    }

    type = "NodePort"

    port {
      port        = 80
      target_port = 80
      node_port   = 30008
    }
  }
}
