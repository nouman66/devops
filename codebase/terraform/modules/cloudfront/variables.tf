variable "bucket_name" {
  type        = string
  description = "The name of the S3 bucket for the website"
}

variable "index_document" {
  type        = string
  description = "The index document for the S3 website"
  default     = "index.html"
}

variable "error_document" {
  type        = string
  description = "The error document for the S3 website"
  default     = "error.html"
}