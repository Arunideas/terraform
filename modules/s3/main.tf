resource "aws_s3_bucket" "codepipeline_artifacts" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.codepipeline_artifacts.id

  versioning_configuration {
    status = "Enabled"
  }
}

output "bucket_name" {
  value = aws_s3_bucket.codepipeline_artifacts.id
}

output "bucket_arn" {
  value = aws_s3_bucket.codepipeline_artifacts.arn
}
