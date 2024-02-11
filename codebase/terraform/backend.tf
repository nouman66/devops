terraform {
  backend "s3" {
    bucket         = "terraform-state-bucket-challenge"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock-table"
    encrypt        = true
  }
}