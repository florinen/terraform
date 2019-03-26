resource "kubernetes_service" "jira-svs" {
  metadata {
    name = "jira-svs"
    namespace = "tools"
  }

  spec {
    selector { app = "jira-pod"  }

    port {
      protocol = "TCP"
      port        = 80
      target_port = 8080
    }

    type = "LoadBalancer"
  }
}