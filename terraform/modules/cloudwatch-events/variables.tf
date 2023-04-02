variable "region" {
  type        = string
  description = "region"
}

variable "environment" {
  type        = string
  description = "The name of the CodeBuild project."
}

variable "codecommit_repo_name" {
  type        = string
  description = "repo name"
}

variable "account_id" {
  type        = string
  description = "account id"
}

variable "codebuild_project_arn" {
    type          = string
    description   = "codebuild project arn"
}

variable "codebuild_role_arn" {
    type          = string
    description   = "codebuild role arn"
}

