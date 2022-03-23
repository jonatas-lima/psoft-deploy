data "aws_s3_object" "stack-file" {
  bucket = var.bucket_name
  key    = "stack.yml"
}

data "aws_s3_object" "migrations-file" {
  bucket = var.bucket_name
  key    = "data.sql"
}

data "aws_s3_object" "backend-env" {
  bucket = var.bucket_name
  key    = "backend.env"
}

data "aws_s3_object" "db-env" {
  bucket = var.bucket_name
  key    = "db.env"
}
