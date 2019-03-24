resource "kubernetes_persistent_volume" "jenkins-pv" {
    metadata {
        name = "jenkins-vlo"
        volume = "jenkins-vol"
    }
    spec {
        capacity {
            storage = "15Gi"
        }
        access_modes = ["ReadWriteMany"]
        persistent_volume_source {
            volume {
                volume_path = "/home/jenkins-app/jenkins-vol"
            }
        }
    }
}