variable "environment" {
  type        = string
  description = "Deployment Environment"
}

variable "private_subnets_id" {
    type        = list
    description = "list of private subnet ids"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block of the vpc"
}

variable "vpc_id" {
  type        = string
  description = "vpc id"
}

