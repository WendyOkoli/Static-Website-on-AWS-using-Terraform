resource "aws_s3_bucket" "wendyokoli_bucket" {
  bucket = "wendyokoli-bucket"
  force_destroy = true
  tags = {
    Name = "wendyokoli-bucket"
  
  }
}


resource "aws_s3_object" "files_upload" {
  for_each    = fileset("modules/s3_bucket/profile/", "*/.*")
  bucket      = "wendyokoli-bucket"
  key         = each.value
  source      = "modules/s3_bucket/profile/${each.value}"
  content_type = "text/html"
}
# resource "aws_s3_bucket_public_access_block" "website_pub_access" {
#   bucket = "wendyo_bucket.id"

#   block_public_acls = false
#   block_public_policy = false
#   ignore_public_acls = false
#   restrict_public_buckets = false
# }

# resource "aws_s3_bucket_policy" "allow_access_from_another_account" {
#   bucket = aws_s3_bucket.wendy-ada-bucket.id
#   policy = data.aws_iam_policy_document.allow_access_from_another_account.json
# }

# data "aws_iam_policy_document" "allow_access_from_another_account" {
#   statement {
#     principals {
#       type        = "AWS"
#       identifiers = ["*"]
#     }

#     actions = [
#       "s3:GetObject",
#       "s3:ListBucket",
#     ]

#     resources = [
#       aws_s3_bucket.wendy-ada-bucket.arn,
#       "${aws_s3_bucket.wendy-ada-bucket.arn}/*",
#     ]
#   }
# }

# resource "aws_s3_bucket_website_configuration" "wendyo_bucket-website" {
#   bucket = aws_s3_bucket.wendyo_bucket.id
  
#   index_document {
#     suffix = "index.html"
  
#   }
#   error_document {
#     key = "error.html"
  
#   }
# }


# resource "aws_s3_object" "files_upload" {
#   for_each = fileset("${path.root}/modules/s3_bucket/profile/", "*/.*")
#   bucket      = aws_s3_bucket.wendyokoli_bucket.bucket
#   key         = each.value
#   source      = "${path.root}/modules/s3_bucket/profile/${each.value}"
#   source_hash = filemd5("${path.root}/modules/s3_bucket/profile/${each.value}")
# }