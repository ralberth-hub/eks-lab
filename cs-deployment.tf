resource "kubernetes_deployment" "nginx" {
  metadata {
    name      = "nginx-deployment"
    namespace = local.common.casestudy.namespace
    labels = {
      app = "nginx"
    }
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        app = "nginx"
      }
    }

    template {
      metadata {
        labels = {
          app = "nginx"
        }
      }

      spec {
        container {
          image = "nginx:latest"
          name  = "nginx"
          port {
            container_port = 80
          }
        }

        affinity {
          node_affinity {
            preferred_during_scheduling_ignored_during_execution {
              weight = 1
              preference {
                match_expressions {
                  key      = "kubernetes.io/hostname"
                  operator = "In"
                  values   = ["ip-10-16-19-40.ap-southeast-1.compute.internal"]
                }
              }
            }
          }
        }
      }
    }
  }
}
