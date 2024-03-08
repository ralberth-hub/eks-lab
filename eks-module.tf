module "eks_blueprints" {
  source = "github.com/aws-ia/terraform-aws-eks-blueprints?ref=v4.25.0"

  cluster_name    = local.common.eks.cluster_name
  cluster_version = local.common.eks.cluster_version
  enable_irsa     = true

  vpc_id = module.vpc.vpc_id

  private_subnet_ids = module.vpc.private_subnets

  managed_node_groups = {
    role = {
      capacity_type   = "ON_DEMAND"
      node_group_name = "general"
      instance_types  = ["t3a.medium"]
      desired_size    = "2"
      max_size        = "3"
      min_size        = "2"
    }
  }
}