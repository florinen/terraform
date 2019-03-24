resource "kubernetes_persistent_volume" "jenkins-pv" {
    metadata {
        name = "terraform-jenkins"
    }
    spec {
        capacity {
            storage = "15Gi"
        }
        access_modes = ["ReadWriteMany"]
        persistent_volume_source {
            host_path {
                path = "/home/jenkins-app/volume"
            }
        }
    }
}