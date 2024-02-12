output "website_url" {
  value = "http://${aws_s3_bucket.bucket.website_endpoint}"
}
output "bucket_name" {
  value = aws_s3_bucket.bucket.id
}