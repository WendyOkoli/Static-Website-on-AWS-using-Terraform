provider "aws" {
  region = "us-east-1"
}

# module "provider" {
#   source = "./modules/init"
# }

module "aws_s3_bucket" {
  source = "./modules/s3_bucket"
  
}

module "cloudfront" {
  source = "./modules/cloudfront"
}