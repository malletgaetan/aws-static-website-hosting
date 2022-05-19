resource "aws_s3_bucket" "website" {
  bucket = var.website_domain # NEED TO BE UNIQUE ACCROSS EVERY WORLDWIDE EXISTING BUCKET
}

# MAKE BUCKET PUBLIC
data "aws_iam_policy_document" "website" {
  statement {
    actions = [
      "s3:GetObject"
    ]
    principals {
      identifiers = ["*"]
      type        = "AWS"
    }
    resources = [
      "arn:aws:s3:::${aws_s3_bucket.website.id}/*"
    ]
  }
}

resource "aws_s3_bucket_policy" "website" {
  bucket = aws_s3_bucket.website.id
  policy = data.aws_iam_policy_document.website.json
}

resource "aws_s3_bucket_public_access_block" "website" {
  bucket             = aws_s3_bucket.website.id
  block_public_acls  = true
  ignore_public_acls = true
}
