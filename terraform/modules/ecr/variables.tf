variable "environment" {
  type        = string
  description = "Deployment Environment"
}

variable "image_tag_mutability" {
    type            = string
    description     = "setting image tag can be changed or not"
    default         = "MUTABLE"
}

variable "scan_on_push" {
    type        = bool
    description = "scan of push"
    default     = true
}

