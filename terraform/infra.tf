
module "networking" {
  source               = "./modules/networking"
  environment          = var.environment
  vpc_cidr             = var.vpc_cidr
  public_subnets_cidr  = var.public_subnets_cidr
  private_subnets_cidr = var.private_subnets_cidr
  availability_zones   = var.availability_zones
}

module "efs" {
  source               = "./modules/efs"
  environment          = var.environment
  vpc_cidr             = var.vpc_cidr
  vpc_id               = module.networking.vpc_id
  private_subnets_id   = flatten("${module.networking.private_subnets_id}")
}

module "rds" {
  source               = "./modules/rds"
  environment          = var.environment
  vpc_cidr             = var.vpc_cidr
  vpc_id               = module.networking.vpc_id
  db_allocated_storage = var.db_allocated_storage
  db_instance_class    = var.db_instance_class
  db_engine            = var.db_engine
  db_engine_version    = var.db_engine_version
  db_parameter_group_name = var.db_parameter_group_name
  db_username          = var.db_username
  db_name              = var.db_name
  private_subnets_id   = flatten("${module.networking.private_subnets_id}")
}

module "secret-manager" {
  source               = "./modules/secret-manager"
  environment          = var.environment
  dbhost               = module.rds.db_endpoint
  dbuser               = var.db_username
  dbpassword           = module.rds.db_password
  dbname               = var.db_name
}

module "loadbalancer" {
  source               = "./modules/loadbalancer"
  environment          = var.environment
  public_subnets_id    = flatten("${module.networking.public_subnets_id}")
  vpc_id               = module.networking.vpc_id
}

module "ecs" {
  source               = "./modules/ecs"
  environment          = var.environment
  vpc_id               = module.networking.vpc_id
  container_cpu        = var.container_cpu
  container_memory     = var.container_memory
  repository_url       = module.ecr.repository_url
  region               = var.region
  desired_count        = var.desired_count
  account_id           = var.account_id
  secret_name          = module.secret-manager.aws_secret_name
  efs_id               = module.efs.efs_id
  access_point_id      = module.efs.access_point_id
  private_subnets_id   = flatten("${module.networking.private_subnets_id}")
  target_group_arn     = module.loadbalancer.target_group_arn
}

