resource "aws_eks_cluster" "cluster" {
  name     = var.cluster_name
  role_arn = aws_iam_role.cluster-role.arn
  version  = var.cluster_version

  #For Encryption Enable
  dynamic "encryption_config" {
    for_each = toset(var.cluster_encryption_config)

    content {
      provider {
        key_arn = encryption_config.value["provider_key_arn"]
      }
      resources = encryption_config.value["resources"]
    }
  }

  vpc_config {
    subnet_ids              = var.private_subnet_ids
    security_group_ids      = [aws_security_group.eks_cluster.id]
    endpoint_private_access = "true"
    endpoint_public_access  = "true"
  }


  kubernetes_network_config {
    service_ipv4_cidr = element(var.service_ipv4_cidr, 1)
  }

  enabled_cluster_log_types = var.enabled_cluster_log_types

  depends_on = [
    aws_iam_role_policy_attachment.aws-eks-cluster-policy,
    aws_iam_role_policy_attachment.aws-eks-service-policy,
    aws_cloudwatch_log_group.eks-log-group
  ]
}

resource "aws_cloudwatch_log_group" "eks-log-group" {
  name              = "/aws/eks/${var.cluster_name}/cluster"
  retention_in_days = 7
}
