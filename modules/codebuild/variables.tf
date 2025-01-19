variable "build_role_arn" {
  description = "Role ARN for CodeBuild"
  type        = string
}

variable "artifact_bucket_name" {
  description = "Name of the S3 bucket for build artifacts"
  type        = string
}

variable "buildspec" {
  description = "Buildspec file content"
  type        = string
}
