terraform {
  backend "s3" {
    bucket = "psoft-deploy"
    key    = "terraform/state1"
    region = "us-east-2"
  }
}
