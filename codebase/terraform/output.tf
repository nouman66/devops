output "bucket_name" {
  value = aws_s3_bucket.bucket.id
  value = module.s3_website.bucket_name
}