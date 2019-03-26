
resource "kubernetes_service" "grafana-service" {
  metadata {
    name = "grafana"
    namespace = "tools"
  }

  spec {
    selector {
      app = "grafana-pod"
    }


    port {
      port        = 80
      target_port = 3000
    }

    type = "LoadBalancer"
  }
}
