resource "kubernetes_deployment" "jenkins-deployment" {
  metadata {
    name      = "terraform-jenkins"
    namespace = "tools"
  
    labels {
      test = "jenkins"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels {
        test = "jenkins"
      }
    }

    template {
      metadata {
        labels {
          test = "jenkins"
        }
      }

      spec {
        volume {
          name = "jenkins-home"
        
        }     

        container {
          image = "fsadykov/centos_jenkins:0.2"
          name  = "jenkins"

          volume_mounts {
            
              mount_path = "/var/jenkins_home"
              name = "jenkins-home"
          }        
    
          resources {
            limits {
              cpu    = "2"
              memory = "500Mi"
            }

            requests {
              cpu    = "2"
              memory = "500Mi"    
           }
          }
        }
      }
    }
  }
}
