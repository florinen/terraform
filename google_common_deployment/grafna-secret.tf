resource "kubernetes_secret" "grafana_secret" {
  metadata {
    name = "grafana"
  }

  data {
    username = "admin-username"
    password = "admin-password"
  }

  type = "Opaque"
}
