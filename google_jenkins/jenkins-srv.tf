resource "kubernetes_service" "jenkins-srv" {
  metadata {
    name = "terraform-jenkins"
    namespace = "tools"
  }

  spec {
    selector {
      test = "jenkins"
    }

    port {
      port        = 80
      target_port = 8080
      node_port   = 30618
    }

    type = "LoadBalancer"
  }
}

resource "kubernetes_pod" "jenkins-pod" {
  metadata {
    name = "terraform-jenkins"
    namespace = "tools"

    labels {
      app = "jenkins"
    }
  }

  spec {
    container {
      image = "fsadykov/centos_jenkins:0.2"
      name  = "jenkins"
    }
  }
}
