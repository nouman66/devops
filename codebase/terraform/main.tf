provider "aws" {
  region = var.aws_region
}

module "s3_website" {
  source = "./modules/s3_website"

  bucket_name              = "${terraform.workspace}-mywebsite"
  website_content_directory = "../path/to/your/website/build"
}