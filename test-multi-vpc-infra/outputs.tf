output "vpc_info" {
  description = "List of VPC Names and IDs"
  value       = {
    for vpc in module.vpc : "${vpc.name}-vpc" => vpc.vpc_id
  }
}

output "vpc_ids" {
  description = "List of VPC IDs"
  value       = [for vpc in module.vpc : vpc.vpc_id]
}