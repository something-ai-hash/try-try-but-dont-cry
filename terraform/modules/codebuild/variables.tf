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

variable "codecommit_repo_arn" {
  type        = string
  description = "codecommit_repo_arn"
}

variable "ecr_repo_arn" {
  type        = string
  description = "ecr_repo_arn"
}

variable "ecs_cluster_name" {
  type        = string
  description = "cluster name"
  default     = "demo cluster"
}

variable "ecs_service_name" {
  type        = string
  description = "ecs service name"
  default     = "demo service"
}

