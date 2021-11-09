variable "vpc_id" {
  description = "vpc id"
  type        = string
  default     = ""
}

variable "peer_vpc_id" {
  description = "peer vpc id"
  type        = string
  default     = ""
}

variable "region" {
  default = ""
}

variable "name" {}

variable "natgw_ids" {
  description = "internet gateway id"
  type        = list(string)
  default     = []
}

variable "rds_subnet" {
  type    = string
  default = ""
}