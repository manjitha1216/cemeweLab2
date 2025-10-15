#########################################################
# Lab 2 - Create Simple S3 Bucket using Terraform
#########################################################

provider "aws" {
  region  = "eu-north-1"
#   profile = "cemewe"
}

#########################################################
# Create S3 bucket
#########################################################
resource "aws_s3_bucket" "lab2_bucket" {
  bucket = "lab2-${var.student_name}-bucket"  # unique bucket name

  tags = {
    Name  = "lab2-${var.student_name}"
    Owner = var.student_name
    Lab   = "2"
  }
}

#########################################################
# Outputs
#########################################################
output "bucket_name" {
  value = aws_s3_bucket.lab2_bucket.bucket
}

output "bucket_arn" {
  value = aws_s3_bucket.lab2_bucket.arn
}
