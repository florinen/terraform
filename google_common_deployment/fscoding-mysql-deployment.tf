resource "kubernetes_deployment" "fscoding-mysql-deployment" {

  metadata {
    namespace = "prod"
    name = "fscoding-mysql-deployment"
    labels { run = "fscoding-mysql" }

  }

  spec {
    replicas = 1
    selector {
      match_labels { run = "fscoding-mysql" } }

    template {
      metadata {
        labels { run = "fscoding-mysql" }
      }

      spec {
        image_pull_secrets = [ { name = "nexus-creds" } ]

        container {
          image = "fsadykov/centos_mysql"
          name  = "fscoding-mysql-container"

          env { name = "MYSQL_USER"     value = "${var.mysql_user}"}
          env { name = "MYSQL_DATABASE" value = "${var.mysql_database}"}

          env_from {
            secret_ref {
              name = "mysql-pass"
            }
          }
        }
      }
    }
  }
}
