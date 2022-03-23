variable "aws_region" {
  default = "us-east-2"
}

variable "amis" {
  type = map(string)
  default = {
    us-east-2 = "ami-0fb653ca2d3203ac1"
  }
}

variable "key_pair_path" {}
variable "bucket_name" {}
