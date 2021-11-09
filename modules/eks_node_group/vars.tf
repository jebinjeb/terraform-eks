variable "private_subnet_ids" {
  type        = list(string)
  description = "Set of instance types associated with the EKS Node Group."
}

variable "cluster_name" {
  type        = string
  description = "EKS cluster name"
  default     = ""
}

variable "node_group_name" {
  description = "Name of the dev Node Group"
  type        = map(any)
  default     = {}
}


variable "ec2_ssh_key" {
  description = "ssh key pair for worker nodes"
  type        = string
  default     = "clix-eks-cluster"
}

variable "ec2_ssh_public_key" {
  description = "ssh public key for worker nodes"
  type        = string
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDDfB8I5mS5GCaBBLa+qiGQw/YwWgDygbAx6E9GRt4Kdti0hQLdPbm3LTWt/sn62i0DQth1VwCdFDLv2nQ+FKk0nqeVXZ8YUu4eFThlI6ZBQPSdRBtZ7xxD9FjCyJhtd4dvREUs4g3O1ajB6454hFcexA53gCtUeKPo3BltIJXfLW9aXb+brseQcuu50zy1i1RQkXldVT3RtfTiKjZh3929yCfgwcC1lr3dPQEpgxTy+xW1AJIGY+IjQFNSXc2cPvkgcE8faVHS3lh4jqjTQ9n1lMN4OxzImEpqSrJaTnNwUW4aVrPApftWE9rIHRUdiczjx4sY7T4FAMP76Df488AKtt1uYHrwLrOsbdoEb05WX43T08dZWSrI+r//v2i+3Hd+Tlk2lRluebTAq1lv172reGAbc0amKRAplL9XLe3Gnx31SbWwRlKrU7/vy5k8cX9TZhM+y8UZyB4rxGH6iWeXaOg+UBvJrUdnMQJ/yIB7dcaNAiGft6gPBWuxumoQE3UX3U0eaGAGDjjFsHRVm8oBLSUxD9VuWRiPyXm7kdL164KJShSK04ajD+nytiCrq4Lz0DYrkhgd8sQ9e4Ilb6Z9jaUrXJTT0QLJ2NhNyh86AWl0pllAbsF5I+iZILj3Es9kxHF6kVBZm3Kf+Twu/BMRNIn9dIFpjzGBDvn7NP3Apw== jebin@jebin-Vostro-3480"
}

variable "disk_size" {
  description = "Disk size in GiB for worker nodes."
  type        = number
  default     = 20
}

variable "instance_types" {
  type        = list(string)
  default     = []
  description = "Set of instance types associated with the EKS Node Group."
}

variable "launch_template_instance_type" {
  type        = string
  default     = "t3a.medium"
  description = "Set of instance types associated with launch template."
}

variable "ami_type" {
  type        = string
  description = "AMI type for the EKS Node Group instance."
  default     = ""
}

variable "desired_size" {
  description = "Desired number of worker nodes in dev group"
  default     = 1
  type        = number
}

variable "max_size" {
  description = "Maximum number of worker nodes in dev group."
  default     = 2
  type        = number
}

variable "min_size" {
  description = "Minimum number of worker nodes in dev group."
  default     = 1
  type        = number
}


