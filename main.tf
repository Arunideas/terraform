provider "aws" {
  region = "ap-south-1"

    default_tags {
    tags = {
      Environment = "Testing"
      Owner       = "arun"
      Project     = "terraform"
    }
  }
}

terraform {
  backend "s3" {
    bucket         = "codepipeline-ap-south-1-744170027108"   # Replace with your S3 bucket name
    key            = "terraform/state/terraform.tfstate" # Path inside the bucket
    #region         = "us-east-1"                  # Replace with your AWS region
    #dynamodb_table = "terraform-lock-table"       # Optional: DynamoDB table for state locking
  }
}


module "s3" {
  source      = "./modules/s3"
bucket_name = var.s3_bucket_name
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
  source_repo_name      = var.source_repo_name
  source_branch         = var.source_branch
  codebuild_project_name = module.codebuild.project_name
}
