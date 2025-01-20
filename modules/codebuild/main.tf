resource "aws_codebuild_project" "codebuild_project" {
  name          = "MyCodeBuildProject"
  service_role  = var.build_role_arn

#  artifacts {
#    type = "S3"
#    location = var.artifact_bucket_name
#  }

   artifacts {
    type = "CODEPIPELINE"
  }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/standard:5.0"
    type                        = "LINUX_CONTAINER"
    privileged_mode             = false
  }

  source {
    type      = "CODEPIPELINE"
    buildspec = var.buildspec
  }
}


