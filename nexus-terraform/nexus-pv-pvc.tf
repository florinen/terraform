resource "kubernetes_persistent_volume" "nexus-pv" {
    metadata {
        name = "terraform-nexus"
    }
    spec {
        capacity {
            storage = "10Gi"
        }
        access_modes = ["ReadWriteOnce"]
        persistent_volume_source {
            host_path {
                path = "/tmp/volume-local"
            }
        }
    }
}

resource "kubernetes_persistent_volume_claim" "nexus-pvc" {
  metadata {
    name = "terraform-nexus"
    namespace = "prod"
  }
  spec {
    access_modes = ["ReadWriteOnce"]
    resources {
      requests {
        storage = "10Gi"
      }
    }
  }
}
