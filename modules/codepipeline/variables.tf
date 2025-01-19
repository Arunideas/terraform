variable "pipeline_role_arn" {
  description = "Role ARN for CodePipeline"
  type        = string
}

variable "artifact_bucket_name" {
  description = "S3 bucket for pipeline artifacts"
  type        = string
}

variable "source_repo_name" {
  description = "CodeCommit repository name"
  type        = string
}

variable "source_branch" {
  description = "Branch in CodeCommit repository"
  type        = string
}

variable "codebuild_project_name" {
  description = "Name of the CodeBuild project"
  type        = string
}
