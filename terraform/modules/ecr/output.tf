output "repo_name_ecr" {
    value = aws_ecr_repository.ecr.name
}

output "repository_url" {
    value = aws_ecr_repository.ecr.repository_url
}

output "ecr_repo_arn" {
    value = aws_ecr_repository.ecr.arn
}
