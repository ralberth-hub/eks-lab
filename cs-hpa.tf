resource "kubernetes_horizontal_pod_autoscaler" "nginx_hpa" {
  metadata {
    name      = "nginx-hpa"
    namespace = local.common.casestudy.namespace
  }

  spec {
    scale_target_ref {
      api_version = "apps/v1"
      kind        = "Deployment"
      name        = kubernetes_deployment.nginx.metadata[0].name
    }

    min_replicas = 2
    max_replicas = 5

    target_cpu_utilization_percentage = 50
  }
}
