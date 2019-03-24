resource "kubernetes_service" "nexus-svc" {
  metadata {
    name = "terraform-nexus"
    namespace = "prod"
  }
  spec {
    selector {
      app = "${kubernetes_pod.nexus-pod.metadata.0.labels.app}"
    }
    port {
      port = 80
      target_port = 8081
    }

    type = "LoadBalancer"
  }
}

resource "kubernetes_pod" "nexus-pod" {
  metadata {
    name = "terraform-nexus"
    namespace = "prod"
    labels {
      app = "nexus"
    }
  }

  spec {
    container {
      image = "fsadykov/docker-nexus"
      name  = "nexus"
    }
  }
}
