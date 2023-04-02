module "ecr" {
  source               = "./modules/ecr"
  environment          = var.environment
}

module "codecommit" {
  source               = "./modules/codecommit"
  environment          = var.environment
}

module "codebuild" {
  source               = "./modules/codebuild"
  environment          = var.environment
  repo_url             = module.codecommit.repo_url
  account_id           = var.account_id
  region               = var.region
  repo_name            = module.ecr.repo_name_ecr
}

