resource "kubernetes_service" "fscoding-service" {
  metadata {
    name = "terraform-example"
    namespace = "prod"
  }
  spec {
    selector { run = "fscoding"  }
    port {
      port = 80
      target_port = 5000
    }

    type = "LoadBalancer"
  }
}
