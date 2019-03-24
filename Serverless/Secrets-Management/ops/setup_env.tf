resource "aws_kms_key" "test-training-key" {
  description = "KMS Key for we45 Training"
  enable_key_rotation = true
}

resource "random_string" "random_dynamo_table_name" {
  length = 10
  lower = true
  special = false
  upper = false
}

resource "random_string" "JWT_PASS" {
  length = 20
}

resource "aws_dynamodb_table" "envelope-db" {
  "attribute" {
    name = "email"
    type = "S"
  }
  hash_key = "email"
  name = "we45-${random_string.random_dynamo_table_name.result}"
  read_capacity = 2
  write_capacity = 2
}

data "aws_iam_policy_document" "training_we45_enc_policy" {
  statement {
    actions = [
      "dynamodb:Query",
      "dynamodb:Scan",
      "dynamodb:GetItem",
      "dynamodb:PutItem"
    ]

    resources = [
      "${aws_dynamodb_table.envelope-db.arn}",
    ]
  }

  statement {
    actions = [
      "kms:Encrypt",
      "kms:Decrypt",
      "kms:GenerateDataKey"
    ]

    resources = ["${aws_kms_key.test-training-key.arn}"]
  }

  statement {
    actions = [
      "ssm:GetParameter",
    ]
    resources = ["${aws_ssm_parameter.jwt-pass.arn}"]
  }

  statement {
    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents"
    ]
    resources = ["arn:aws:logs:*:*:*"]
  }
}

resource "aws_iam_policy" "envelope_policy" {
  name = "we45-training"
  description = "we45-training"
  policy = "${data.aws_iam_policy_document.training_we45_enc_policy.json}"
}

resource "aws_iam_role" "envelope_role" {
  name = "we45-training-role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "envelope-role-policy" {
  policy_arn = "${aws_iam_policy.envelope_policy.arn}"
  role = "${aws_iam_role.envelope_role.name}"
}

resource "aws_ssm_parameter" "jwt-pass" {
  name = "we45-training-jwt-pass"
  type = "SecureString"
  value = "${random_string.JWT_PASS.result}"
}

data "template_file" "config_chalice" {
  template = "${file("config.json.tpl")}"
  vars {
    ROLE_NAME = "${aws_iam_role.envelope_role.arn}"
    DB_TABLE = "${aws_dynamodb_table.envelope-db.name}"
    KEY_ID = "${aws_kms_key.test-training-key.key_id}"
  }
}

resource "local_file" "variables_json" {
  filename = "config.json"
  content = "${data.template_file.config_chalice.rendered}"
}