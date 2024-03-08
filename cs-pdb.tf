resource "kubernetes_pod_disruption_budget_v1" "casestudy_pdb" {
  metadata {
    name      = "casestudy-pdb"
    namespace = local.common.casestudy.namespace
  }

  spec {
    max_unavailable = 1 # Maximum number of pods that can be unavailable
    selector {
      match_labels = {
        app = "nginx"
      }
    }
  }
}
