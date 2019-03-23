resource "kubernetes_namespace" "tools" {
  metadata {
    annotations {
      name = "jira-annotation"
    }

    labels {
      mylabel = "jira-value"
    }

    name = "terraform-jira-ns"
  }
}
