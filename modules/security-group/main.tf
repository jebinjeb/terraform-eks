module "sg-istio-ingress" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "sg-istio-ingress"
  description = "HTTP security group."
  vpc_id      = module.vpc-ayushsharma-in.vpc_id

  egress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 65535
      protocol    = "all"
      description = "Open internet"
      cidr_blocks = "0.0.0.0/0"
    }
  ]

  ingress_with_cidr_blocks = [

    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      description = "HTTP"
      cidr_blocks = "0.0.0.0/0"
    }
  ]

  tags = {
    env     = "production"
    project = "my-project"
    owner   = "ayushsharma.in"
  }
}
