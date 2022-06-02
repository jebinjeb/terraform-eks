variable "region" {}
variable "eks_cluster_name" { default = "" }
variable "name" {}

variable "cidr" {
  default = "10.0.0.0/16"
}

variable "private_subnets" {
  default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "public_subnets" {
  default = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
}

variable "database_subnets" {
  default = ["10.0.201.0/24", "10.0.202.0/24", "10.0.203.0/24"]
}
