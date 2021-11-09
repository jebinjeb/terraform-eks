variable "vpc_id" {
  description = "vpc id"
  type        = string
  default     = ""
}

variable "vpc_cidr" {
  description = "vpc cidr"
  type        = string
  default     = ""
}

variable "private_subnet_ids" {
  type = list(string)
  description = "Set of instance types associated with the EKS Node Group."
  default     = []
}

variable "cluster_name" {
  type        = string
  description = "EKS cluster name"
  default     = ""
}

variable "cluster_version" {
  type        = string
  description = "EKS cluster version"
  default     = ""
}

variable "cluster_sg_name" {
  description = "Name of the EKS cluster Security Group"
  type        = string
  default     = ""
}


variable "service_ipv4_cidr" {
  type = list(string)
  default = [] 
}

variable "enabled_cluster_log_types" {
  type = list(string)
  default = []
}

variable "vpc_name" {
  type = list(string)
  default = []
}

variable "subnet_names" {
  type = list(string)
  default = []
}

variable "eks_cluster_role" {
  type = string
  default = ""
}

variable "cluster_encryption_config" {
  description = "Configuration block with encryption configuration for the cluster."
  type = list(object({
    provider_key_arn = string
    resources        = list(string)
  }))
  default = []
}
