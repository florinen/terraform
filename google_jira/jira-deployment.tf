resource "kubernetes_deployment" "terraform-jira" {
  metadata {
    name      = "terraform-jira"
    labels    = { app = "jira-terraform-deployment" }
    namespace = "tools"
   }

  spec {
    replicas = 1

    selector {
      match_labels {
        app = "jira-pod"
      }
    }

    template {
      metadata {
        labels {
          app = "jira-pod"
        }
      }

      spec {
        container {
          image = "gcr.io/hightowerlabs/jira:7.3.6-standalone"
          name  = "jira"
          volume_mount {
             name       = "jira-home"
             mount_path = "/opt/jira-home"
           }
          }
           volume {
          name = "jira-home"
        }
        }

      }
    }
  }
