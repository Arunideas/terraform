variable "s3_bucket_name" {
  description = "Name of the S3 bucket for CodePipeline artifacts"
  type        = string
}

variable "source_repo_name" {
  description = "Name of the source repository in CodeCommit"
  type        = string
}

variable "source_branch" {
  description = "Branch to track in CodeCommit"
  type        = string
  default     = "main"
}
