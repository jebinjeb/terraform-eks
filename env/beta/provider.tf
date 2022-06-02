terraform {
  backend "s3" {
    bucket = "eks-state-xrengine"
    key    = "eks-cluster-beta"
    region = "us-east-1"
  }
}

provider "aws" {
  region = var.region
}
