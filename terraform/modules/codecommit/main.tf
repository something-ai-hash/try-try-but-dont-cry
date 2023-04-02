resource "aws_codecommit_repository" "repo" {
  repository_name  = "${var.environment}-repo"
  description = "Terraform-managed CodeCommit repository."
}