resource "kubernetes_namespace" "casestudy_ns" {
  metadata {
    name = local.common.casestudy.namespace
  }
}