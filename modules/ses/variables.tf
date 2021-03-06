variable "domain" {
  description = "The domain to create the SES identity for."
  type        = string
}

variable "route53_zone_id" {
  type        = string
  description = "Route53 parent zone ID. If provided (not empty), the module will create Route53 DNS records used for verification"
  default     = "1234556"
}

