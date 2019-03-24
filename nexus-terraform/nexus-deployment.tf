resource "kubernetes_deployment" "nexus-deployment" {
  metadata {
    name      = "terraform-nexus"
    namespace = "prod"
    labels {
      test = "nexus"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels {
        test = "nexus"
      }
    }

    template {
      metadata {
        labels {
          test = "nexus"
        }
      }

      spec {
        container {
          image = "fsadykov/docker-nexus"
          name  = "nexus"

          resources{
            requests{
              cpu    = "500m"
              memory = "4800Mi"
            }
          }
        }
      }
    }
  }
}
