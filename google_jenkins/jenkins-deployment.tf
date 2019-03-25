resource "kubernetes_deployment" "jenkins-deployment" {
  metadata {
    name      = "terraform-jenkins"
    namespace = "tools"

    labels {
      test = "jenkins"
    }
  }

  spec { replicas = 1

    selector { match_labels { test = "jenkins" }
    }

    template {
      metadata { labels { test = "jenkins" } }

    spec {
      container {
          image = "fsadykov/centos_jenkins:0.2"
          name  = "jenkins"

          }

          volume_mount {
              mount_path = "/var/run"
              name = "docker-sock"
              }

          volume {
               host_path = "/var/run"
               name = "docker-sock"
               }
             }
           }
         }
       }
