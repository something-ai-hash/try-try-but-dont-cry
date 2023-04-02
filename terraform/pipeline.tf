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

module "cloudwatch-events" {
  source               = "./modules/cloudwatch-events"
  environment          = var.environment
  region               = var.region
  codecommit_repo_name = module.codecommit.codecommit_repo_name
  account_id           = var.account_id
  codebuild_project_arn  = module.codebuild.codebuild_arn
  codebuild_role_arn     = module.codebuild.codebuild_role_arn
}

