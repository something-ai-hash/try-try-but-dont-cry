variable "environment" {
  type        = string
  description = "Deployment Environment"
}

variable "vpc_id" {
  type        = string
  description = "vpc id where we have to deploy rds"
}

variable "container_cpu" {
  type        = number
  description = "container cpu"
}

variable "container_memory" {
  type        = number
  description = "container memory"
}

variable "repository_url" {
   type        = string
   description = "repository_url"
}

variable "image_tag" {
   type        = string
   description = "image_tag"
   default     = "latest"
}

variable "region" {
    type          = string
    description   = "region"
}

variable "hostport" {
    type          = number
    description   = "hostport"
    default       = 80
}

variable "containerport" {
    type         = number
    description  = "containerport"
    default       = 80
}

variable "desired_count" {
    type         = number
    description  = "desired count"
}

variable "account_id" {
    type = string
    description = "account id"
}

variable "secret_name" {
    type = string
    description = "secret name"
}

variable "efs_id" {
    type        = string
    description = "efs_id"
}

variable "access_point_id" {
    type = string
    description = "access_point_id"
}

variable "private_subnets_id" {
    type = list
    description = "private subnets ids"
}

variable "target_group_arn" {
    type = string
    description = "arn of target group"
}

