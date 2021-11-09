#SSH key
resource "aws_key_pair" "deployer" {
  key_name   = var.ec2_ssh_key
  public_key = var.ec2_ssh_public_key
}

# node group
resource "aws_eks_node_group" "node_group" {
  for_each        = var.node_group_name
  cluster_name    = var.cluster_name
  node_group_name = each.key
  node_role_arn   = aws_iam_role.eks_nodes.arn
  subnet_ids      = var.private_subnet_ids
  capacity_type   = each.value
  instance_types  = var.instance_types
  ami_type        = var.ami_type
  disk_size       = var.disk_size

  scaling_config {
    desired_size = var.desired_size
    max_size     = var.max_size
    min_size     = var.min_size
  }

  remote_access {
    ec2_ssh_key = var.ec2_ssh_key
  }

  tags = {
    Name = each.key #"${var.node_group_name[count.index]}"
  }

  depends_on = [
    aws_iam_role_policy_attachment.aws_eks_worker_node_policy,
    aws_iam_role_policy_attachment.aws_eks_cni_policy,
    aws_iam_role_policy_attachment.cluster_autoscaler,
    aws_iam_role_policy_attachment.aws_eks_ECR_readonlypolicy
  ]
}

