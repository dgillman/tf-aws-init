module "env" {
  source = "github.com/dgillman/tf-aws-env"
  version = "${var.env_module_version}"

  client = "${var.client}"
  project = "${var.project}"

  # use of workspaces eliminates need for per-phase state bucket
  release_phase = ""
}
