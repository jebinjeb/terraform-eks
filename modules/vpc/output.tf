output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "vpc_cidr_block" {
  description = "The CIDR of the VPC"
  value       = module.vpc.vpc_cidr_block
}

output "private_subnets" {
  description = "private subnets"
  value       = module.vpc.private_subnets
}

output "natgw_ids" {
  description = "natgw ids"
  value       = module.vpc.natgw_ids
}