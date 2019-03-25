resource "kubernetes_deployment" "terraform-jenkins" {
  metadata {
    name = "terraform-jenkins"
    labels { app = "jenkins-terraform-deployment" }
    namespace = "tools"
  }

  spec {
    replicas = 1

    selector { match_labels { app = "jenkins-pod" }
    }

    template {
      metadata { labels { app = "jenkins-pod" }
      }

      spec {
        container {
          image = "fsadykov/centos_jenkins:0.3"
          name  = "jenkins"

          volume_mount {
            name = "docker-sock"
            mount_path = "/var/run"
          }

        }

        volume {
          name = "docker-sock"
          host_path = { path = "/var/run" }
        }
      }
    }
  }
}
