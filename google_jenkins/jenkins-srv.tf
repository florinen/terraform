resource "kubernetes_service" "jenkins-service" {
  metadata {
    name = "jenkins-service"
    namespace = "apps"
  }

  spec {
    selector { app = "jenkins-pod" }
    port {

      protocol = "TCP"
      port = 81
      node_port = 31162
      target_port = 8080
    }

    type = "LoadBalancer"
    external_ips = ["10.10.40.51","10.10.40.52" ]
  }
}
