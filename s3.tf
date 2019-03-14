resource "aws_s3_bucket" "remote_state_bucket" {
  bucket = "${local.remote_state_bucket}"
  acl    = "private"

  tags = "${module.env.tags}"
}
