variable "region" {
  type = string
}

variable "repo_name" {
  type        = list(string)
  default     = ["istio", "istio-proxy"]
  description = "ecr repository names"
}
