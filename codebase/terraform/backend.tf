terraform {
  backend "s3" {
    bucket         = "terraform-state-bucket-challenge"
    key            = "state/${terraform.workspace}/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock-table"
    encrypt        = true
  }
}