variable "environment" {
  description = "Deployment Environment"
}

variable "vpc_cidr" {
  description = "CIDR block of the vpc"
}

variable "public_subnets_cidr" {
  type        = list
  description = "CIDR block for Public Subnet"
}

variable "private_subnets_cidr" {
  type        = list
  description = "CIDR block for Private Subnet"
}

variable "availability_zones" {
  type        = list
  description = "AZ in which all the resources will be deployed"
}

# variables for rds

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

variable "db_username" {
  type        = string
  description = "username of db"
}

variable "db_name" {
  type        = string
  description = "name of db"
}

variable "region" {
  type        = string
  description = "region"
}

variable "account_id" {
  type        = string
  description = "account id"
}

variable "container_cpu" {
  type        = number
  description = "container cpu"
}

variable "container_memory" {
  type        = number
  description = "container memory"
}

variable "desired_count" {
  type        = number
  description = "desired count"
}
