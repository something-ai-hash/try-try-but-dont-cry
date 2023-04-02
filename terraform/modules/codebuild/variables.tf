variable "environment" {
  type        = string
  description = "The name of the CodeBuild project."
}

variable "repo_url" {
  type        = string
  description = "The location of the source code to build."
}

variable "account_id" {
  type        = string
  description = "account id of the aws account"
}

variable "region" {
  type        = string
  description = "region"
}

variable "repo_name" {
  type        = string
  description = "repo name"
}


