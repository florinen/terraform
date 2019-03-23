resource "kubernetes_persistent_volume_claim" "jira-pvc" {
  metadata {
    name = "terraform-jira"
    namespace = "tools"
  }

  spec {
    access_modes = ["ReadWriteOnce"]

    resources {
      requests {
        storage = "15Gi"
      }
    }

    volume_name = "jira-pv"
  }
}
