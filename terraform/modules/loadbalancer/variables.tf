variable "environment" {
  type        = string
  description = "Deployment Environment"
}

variable "public_subnets_id" {
  type        = list
  description = "public subnets ids"
}

variable "vpc_id" {
    type           = string
    description    = "vpc id of subnets"
}