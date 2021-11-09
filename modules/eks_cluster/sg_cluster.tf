resource "aws_security_group" "eks_cluster" {
  name        = var.cluster_sg_name
  description = "SG cluster and worker nodes"
  vpc_id      = var.vpc_id
   
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }


  tags = {
    Name = var.cluster_sg_name
  }
}

resource "aws_security_group_rule" "cluster_ssh_inbound" {
  description              = "Allow worker nodes to communicate with the cluster API Server"
  from_port                = 22
  protocol                 = "tcp"
  security_group_id        = aws_security_group.eks_cluster.id
  cidr_blocks              =  [var.vpc_cidr]  #var.vpc_cidr
  to_port                  = 22
  type                     = "ingress"
}

resource "aws_security_group_rule" "cluster_http_inbound" {
  description              = "Allow http communication"
  from_port                = 80
  protocol                 = "tcp"
  security_group_id        = aws_security_group.eks_cluster.id
  cidr_blocks              = ["0.0.0.0/0"]
  to_port                  = 80
  type                     = "ingress"
}

resource "aws_security_group_rule" "cluster_https_inbound" {
  description              = "Allow https communication"
  from_port                = 443
  protocol                 = "tcp"
  security_group_id        = aws_security_group.eks_cluster.id
  cidr_blocks              = ["0.0.0.0/0"]
  to_port                  = 443
  type                     = "ingress"
}

resource "aws_security_group_rule" "self-traffic" {
  description              = "Allow nodes to communicate with each other"
  from_port                = 0
  protocol                 = "-1"
  security_group_id        = aws_security_group.eks_cluster.id
  source_security_group_id = aws_security_group.eks_cluster.id
  to_port                  = 65535
  type                     = "ingress"
}

