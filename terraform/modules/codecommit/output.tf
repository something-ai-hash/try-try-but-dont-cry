output "repo_url" {
  value = aws_codecommit_repository.repo.clone_url_http
}

output "codecommit_repo_name" {
  value = aws_codecommit_repository.repo.repository_name
}