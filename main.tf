provider "aws" {
  region = "us-east-1"
}

module "s3" {
  source      = "./modules/s3"
bucket_name = "codepipeline"
}

module "iam" {
  source                = "./modules/iam"
  s3_bucket_arn         = module.s3.bucket_arn
  s3_bucket_name        = module.s3.bucket_name
}

module "codebuild" {
  source                = "./modules/codebuild"
  build_role_arn        = module.iam.codebuild_role_arn
  artifact_bucket_name  = module.s3.bucket_name
  buildspec             = file("buildspec.yml") # Path to the buildspec file
}

module "codepipeline" {
  source                = "./modules/codepipeline"
  pipeline_role_arn     = module.iam.codepipeline_role_arn
  artifact_bucket_name  = module.s3.bucket_name
  source_repo_name      = "kube"
  source_branch         = "master"
  codebuild_project_name = module.codebuild.project_name
}
