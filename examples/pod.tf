resource "kubernetes_pod" "fscoding" {
  metadata {
    name = "terraform-fscoding"
  }

  spec {
    container {
      image = "fsadykov/centos_python"
      name  = "fscoding"
      tty = true

      env {
        # Giving example variables for the container
        name  = "mysql_user"
        value = "example_user"
      }
    }
  }
}
