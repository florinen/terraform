resource "kubernetes_persistent_volume" "jira-pv" {
  metadata {
    name = "terraform-jira"
  }

  spec {
    capacity {
      storage = "15Gi"
    }
    access_modes = ["ReadWriteMany"]
    persistent_volume_source {
      vsphere_volume {
        volume_path = "/var/jira-home"
            }
   }
 }
}
