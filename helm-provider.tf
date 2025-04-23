data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_name   # <= change here
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_name   # <= and here
}


provider "helm" {
  kubernetes {
    host                   = data.aws_eks_cluster.cluster.endpoint
    cluster_ca_certificate = base64decode(
      data.aws_eks_cluster.cluster.certificate_authority[0].data
    )

    token = data.aws_eks_cluster_auth.cluster.token
  }
}

