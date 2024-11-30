provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "kubernetes_namespace" "crewmeister" {
  metadata {
    name = var.namespace
  }
}

resource "helm_release" "crewmeister_app" {
  name       = var.helm_chart_name
  namespace  = kubernetes_namespace.crewmeister.metadata[0].name
  chart      = "./crewmeister-app"

  set {
    name  = "image.repository"
    value = var.ecr_image_uri
  }

  set {
    name  = "image.tag"
    value = "latest"
  }

  set {
    name  = "service.port"
    value = "8080"
  }

  depends_on = [kubernetes_namespace.crewmeister]
}

