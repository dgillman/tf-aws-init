module "env" {
  source = "github.com/dgillman/tf-aws-env?ref=0.0.4"

  client = "${var.client}"
  project = "${var.project}"
}
