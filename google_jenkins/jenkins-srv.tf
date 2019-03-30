resource "kubernetes_service" "jenkins-service" {
  metadata {
    name = "jenkins-service"
    namespace = "apps"
  }

  spec {
    selector { app = "jenkins-pod" }
    port {

      protocol = "TCP"
      port = 80
      target_port = 8080
    }

    type = "LoadBalancer"
    external_ips = "10.10.40.50"
  }
}
