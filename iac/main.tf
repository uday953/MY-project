provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "app_bucket" {
  bucket = "cicd-demo-app-bucket-example"
  acl    = "public-read"
}
