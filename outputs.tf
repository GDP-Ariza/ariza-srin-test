output "cluster_name" {
  value = aws_eks_cluster.eks.name
}

output "kubeconfig" {
  value = yamlencode({
    apiVersion = "v1"
    clusters = [{
      name = aws_eks_cluster.eks.name
      cluster = {
        server = aws_eks_cluster.eks.endpoint
        "certificate-authority-data" = aws_eks_cluster.eks.certificate_authority[0].data
      }
    }]
    contexts = [{
      name = aws_eks_cluster.eks.name
      context = {
        cluster = aws_eks_cluster.eks.name
        user    = aws_eks_cluster.eks.name
      }
    }]
    current-context = aws_eks_cluster.eks.name
    users = [{
      name = aws_eks_cluster.eks.name
      user = {
        exec = {
          apiVersion = "client.authentication.k8s.io/v1beta1"
          command    = "aws"
          args       = ["eks", "get-token", "--cluster-name", aws_eks_cluster.eks.name]
        }
      }
    }]
  })
  sensitive = true
}
