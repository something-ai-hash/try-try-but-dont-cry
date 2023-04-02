output "repo_name_ecr" {
  value = [module.ecr.repo_name_ecr]
}

output "private_subnets_id" {
  value = module.networking.private_subnets_id
}

