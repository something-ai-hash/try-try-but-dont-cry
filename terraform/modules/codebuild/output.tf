output "codebuild_name" {
  value = aws_codebuild_project.codebuild.name
}

output "codebuild_arn" {
  value = aws_codebuild_project.codebuild.arn
}

output "codebuild_role_arn" {
  value = aws_iam_role.codebuild.arn
}