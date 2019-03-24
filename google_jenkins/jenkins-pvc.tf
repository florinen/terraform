resource "kubernetes_persistent_volume_claim" "jenkins" {
  metadata {
    name = "jenkins-pvc"
    app = "jenkins"
  }
  
  spec {
    access_modes = ["ReadWriteMany"]
    resources {
      requests {
        storage = "15Gi"
      }
    }
    volume_name = "${kubernetes_persistent_volume.jenkins.metadata.0.name}"
  }
   
 }
