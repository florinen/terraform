resource "kubernetes_persistent_volume_claim" "jenkins-pvc" {
  metadata {
    name = "terraform-jenkins"
    namespace = "tools"
  }
 
  spec {
    access_modes = ["ReadWriteOnce"]
    resources {
      requests {
        storage = "15Gi"
      }
    }
    
  }

}
