variable "aws_region" {
  description = "Target region for creation of AWS assets"
  default = "us-west-1"
}

variable "aws_credential_file" {
  description = "Local source for TOML-formated AWS credential file"
  type = "string"
  default = ""
}

variable "aws_profile" {
  description = "Profile within var.aws_credential_file to use when accessing AWS"
  default = "default"
}

variable "client" {
  description = "Client this environment is developed for"
  default = "etinerant"
}

variable "project" {
  description = "Project this environment is developed for"
  default = "sample"
}

variable "remote_state_s3_bucket" {
  description = "Name for S3 bucket that will contain project remote state"
  default = ""
}

variable "remote_state_key" {
  description = "Path to remote state within bucket (default: remote_state)"
  default = ""
}

variable "create_iam_role" {
  description = "Set to 0 if an IAM role to manage remote state is not desired (default is 1)"
  default = 1
}