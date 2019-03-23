resource "kubernetes_deployment" "fscoding-deployment" {

  metadata {
    namespace = "prod"
    name = "fscoding-deployment"
    labels { run = "fscoding" }

  }

  spec {
    replicas = 3
    selector {
      match_labels { run = "fscoding" } }

    template {
      metadata {
        labels { run = "fscoding" }
      }

      spec {
        image_pull_secrets = [ { name = "nexus-creds" } ]

        container {
          image = "nexus.fscoding.com:8085/fscoding"
          name  = "fscoding-container"
          command = [ "python", "/app/app.py" ]

          env { name = "MYSQL_USER"     value = "${var.mysql_user}" }
          env { name = "MYSQL_DATABASE" value = "${var.mysql_database}" }
          env { name = "MYSQL_HOST"     value = "${var.mysql_host}" }
          env { name = "SECRET_KEY"     value = "${var.mysql_secret_key}" }

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
