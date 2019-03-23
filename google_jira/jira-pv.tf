resource "kubernetes_persistent_volume" "jira-pv" {
  metadata {
    name = "terraform-jira"
  }

  spec {
    capacity {
      storage = "30Gi"
    }

    access_modes = ["ReadWriteOnce"]
  }
}
