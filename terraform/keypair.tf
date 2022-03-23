resource "aws_key_pair" "deploy-kp" {
  key_name   = "deploy-kp"
  public_key = file(var.key_pair_path)
}
