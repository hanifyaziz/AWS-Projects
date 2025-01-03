resource "aws_s3_bucket" "hanif_webbucket" {
    bucket = "hanif-static-web"
  
}
resource "aws_s3_bucket_public_access_block" "hanif_webbucket" {
  bucket = aws_s3_bucket.hanif_webbucket.id

  block_public_acls = false
  ignore_public_acls = false
  block_public_policy = false
  restrict_public_buckets = false
}

resource "aws_s3_object" "index" {
  bucket = aws_s3_bucket.hanif_webbucket.id
  key = "index.html"
  source = "index.html"
  content_type = "text/html"
}

resource "aws_s3_object" "index_image" {
  bucket = aws_s3_bucket.hanif_webbucket.id
  key = "assets/giphy.webp"
  source = "assets/giphy.webp"
  content_type = "image/webp"
}


resource "aws_s3_bucket_website_configuration" "hanif_webbucket" {
  bucket = aws_s3_bucket.hanif_webbucket.id

  index_document {
    suffix = "index.html"
  }

}

resource "aws_s3_bucket_policy" "public_read_access" {
  bucket = aws_s3_bucket.hanif_webbucket.id
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
	    "Principal": "*",
      "Action": [ "s3:GetObject" ],
      "Resource": ["${aws_s3_bucket.hanif_webbucket.arn}/*"]
    }
  ]
}
EOF

depends_on = [aws_s3_bucket_public_access_block.hanif_webbucket]
}