variable "environment" {
  description = "Deployment Environment"
}

variable "vpc_id" {
  type        = string
  description = "vpc id where we have to deploy rds"
}

variable "vpc_cidr" {
    type        = string
    description = "vpc cidr where we have to deploy"
}

variable "db_port" {
  type        = number
  description = "database port for rds(tcp)"
  default     = 3306
}

variable "db_allocated_storage" {
  type        = number
  description = "allocated storages in bytes"
}

variable "db_instance_class" {
  type        = string
  description = "instance family of database"
}

variable "db_engine" {
  type        = string
  description = "The database engine to use"
}

variable "db_engine_version" {
  type        = string
  description = "The engine version to use"
}

variable "db_parameter_group_name" {
  type        = string
  description = "Name of the DB parameter group to associate"
}

variable "db_skip_final_snapshot" {
  type        = bool
  description = "skip final snapshot"
  default     = true
}

variable "db_username" {
  type        = string
  description = "username of db"
}

variable "db_name" {
  type        = string
  description = "name of db"
}

variable "private_subnets_id" {
  type        = list(string)
  description = "Subnets to deploy in"
}


