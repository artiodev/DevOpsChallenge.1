module "ecr-repo" {
  source = "./../modules/ecr"
  ecr_name = var.ecr_name
  tags = var.tags
  image_mutability = var.image_mutability
}

module "codebuild" {
  source = "./../modules/codebuild"
  account_id = var.account_id
  codebuild_params = var.codebuild_params
  environment_variables = var.environment_variables
}