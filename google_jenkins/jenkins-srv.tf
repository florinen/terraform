resource "kubernetes_service" "jenkins-service" {
  metadata {
    name = "jenkins-service"
    namespace = "apps"
  }

  spec {
    selector { app = "jenkins-pod" }
    external_ips {
      ip = "10.10.40.50"
    }
    port {

      protocol = "TCP"
      port = 80
      target_port = 8080
    }

    type = "LoadBalancer"
  }
}
