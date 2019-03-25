resource "kubernetes_service" "jenkins-srv" {
  metadata {
    name = "terraform-jenkins"
    namespace = "tools"
  }

  spec {
    selector { app = "jenkins-terraform" }

    port {
      port        = 80
      target_port = 8080
    }
    type = "LoadBalancer"
  }
}
