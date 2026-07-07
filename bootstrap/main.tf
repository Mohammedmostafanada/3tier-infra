resource "aws_s3_bucket" "terraform_state" {
  bucket = "my-tf-project-state-bucket"

  lifecycle {
    prevent_destroy = true
  }

}

#enable versioning for the S3 bucket to keep track of changes to the state file
resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.terraform_state.id

  versioning_configuration {
    status = "Enabled"
  }
}

#enable server-side encryption for the S3 bucket to encrypt the state file at rest
resource "aws_s3_bucket_server_side_encryption_configuration" "sse" {
  bucket = aws_s3_bucket.terraform_state.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

#enable public access block for the S3 bucket to prevent public access to the state file
resource "aws_s3_bucket_public_access_block" "public_access_block" {
  bucket = aws_s3_bucket.terraform_state.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

#enable logging for the S3 bucket to log access to the state file
resource "aws_s3_bucket_policy" "state_bucket_policy" {
  bucket = aws_s3_bucket.terraform_state.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "AllowTeamAccess"
        Effect = "Allow"
        Principal = {
          AWS = [
            "arn:aws:iam::911078381059:user/ahmed_r0001",
            # "arn:aws:iam::123456789012:user/your-friends-iam-username"
          ]
        }
        Action = [
          "s3:ListBucket",
          "s3:GetObject",
          "s3:PutObject",
          "s3:DeleteObject"
        ]
        Resource = [
          aws_s3_bucket.terraform_state.arn,
          "${aws_s3_bucket.terraform_state.arn}/*"
        ]
      }
    ]
  })
}
