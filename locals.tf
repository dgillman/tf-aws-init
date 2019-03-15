locals {
  remote_state_bucket = "${coalesce(var.remote_state_s3_bucket, "${module.env.projectname}-state")}"
  remote_state_key = "${coalesce(var.remote_state_key, "remote_state")}"
}