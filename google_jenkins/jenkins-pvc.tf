resource "kubernetes_persistent_volume_claim" "jenkins-pvc" {
  metadata {
    name = "jenkins-pvc"
    namespace = "tools"
  }
 
  spec {
    access_modes = ["ReadWriteMany"]
    resources {
      requests {
        storage = "15Gi"
      }
    }
   
  }

}
