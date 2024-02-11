resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
  acl    = "public-read"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action    = ["s3:GetObject"]
        Effect    = "Allow"
        Principal = "*"
        Resource  = ["arn:aws:s3:::${var.bucket_name}/*"]
      },
    ]
  })
}

resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.bucket.id

  index_document {
    suffix = var.index_document
  }

  error_document {
    key = var.error_document
  }
}

resource "aws_s3_object" "website_files" {
  for_each = fileset(var.website_content_directory, "**/*")
  bucket   = aws_s3_bucket.bucket.id
  key      = each.value
  source   = "${var.website_content_directory}/${each.value}"
  etag     = filemd5("${var.website_content_directory}/${each.value}")
}

