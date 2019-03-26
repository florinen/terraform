resource "kubernetes_deployment" "grafana" {
  metadata {
    name = "grafana"
    namespace = "tools"
    labels {
      test = "grafana"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels {
        app = "grafana-pod"
      }
    }
    template {
      metadata {
        labels {
          app = "grafana-pod"
        }
      }

      spec {
        volume {
          name = "docker-sock"
          host_path = { path = "/var/run" }
          }
        container {
          image = "grafana/grafana:6.0.0"
          name  = "grafana"

          volume_mount {
            name  =  "docker-sock"
            mount_path  =  "/var/run"
          }
        }
      }
    }
  }
}
