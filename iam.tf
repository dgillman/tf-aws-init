resource "aws_iam_role" "manage-role" {
  name = "manage-${module.env.fullname}-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

  tags = "${module.env.tags}"

  count = "${var.create_iam_role}"
}

resource "aws_iam_policy" "manage-policy" {
  name = "manage-${module.env.fullname}-state"
  description = "Role with ability to manage state for ${module.env.fullname} project"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "s3:ListBucket",
      "Resource": "${aws_s3_bucket.remote_state_bucket.arn}"
    },
    {
      "Effect": "Allow",
      "Action": ["s3:GetObject", "s3:PutObject"],
      "Resource": "${aws_s3_bucket.remote_state_bucket.arn}/${local.remote_state_key}"
    }
  ]
}
EOF

  count = "${var.create_iam_role}"
}

resource "aws_iam_role_policy_attachment" "manage-state-attachment" {
  role       = "${aws_iam_role.manage-role.name}"
  policy_arn = "${aws_iam_policy.manage-policy.arn}"

  count = "${var.create_iam_role}"
}