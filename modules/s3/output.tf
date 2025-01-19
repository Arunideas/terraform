output "bucket_name" {
  value = aws_s3_bucket.codepipeline_artifacts.id
}

output "bucket_arn" {
  value = aws_s3_bucket.codepipeline_artifacts.arn
}
