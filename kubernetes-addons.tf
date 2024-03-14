module "kubernetes_addons" {
  source = "github.com/aws-ia/terraform-aws-eks-blueprints//modules/kubernetes-addons?ref=v4.32.1"

  eks_cluster_id = module.eks_blueprints.eks_cluster_id

  enable_metrics_server = true  

}