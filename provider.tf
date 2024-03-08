provider "aws" {
  region                   = "ap-southeast-1"
  shared_credentials_files = ["~/.aws/credentials"]
  profile                  = local.common.terraform_profile
  skip_metadata_api_check  = true

  default_tags {
    tags = {
      "DeploymentRepo" = local.common.deploymentrepo
    }
  }

}

provider "kubernetes" {
  host                   = module.eks_blueprints.eks_cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks_blueprints.eks_cluster_certificate_authority_data)

  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    command     = "aws"
    args        = ["eks", "get-token", "--cluster-name", module.eks_blueprints.eks_cluster_id]
  }
}