locals {
  host_list_ssm_name = "${local.name_prefix}/host-list"
  site_name_ssm_name = "${local.name_prefix}/site-name"
}

resource "aws_ssm_parameter" "host_list" {
  name  = local.host_list_ssm_name
  type  = "StringList"
  value = join(",", aws_instance.main.*.private_dns)
}

resource "aws_ssm_parameter" "site_name" {
  name  = local.site_name_ssm_name
  type  = "String"
  value = "${local.name_prefix}-taco-wagon"
}

data "aws_iam_policy_document" "ssm_access" {
  statement {
    effect  = "Allow"
    actions = ["ssm:GetParameter"]

    resources = ["*"]
  }
}

resource "aws_iam_policy" "ssm_policy" {
  name        = "ssm-policy"
  description = "A policy to access ssm parameters"
  policy      = data.aws_iam_policy_document.ssm_access.json
}

resource "aws_iam_policy_attachment" "ssm-attach" {
  name       = "ssm-attachment"
  roles      = [var.ec2_iam_role]
  policy_arn = aws_iam_policy.ssm_policy.arn
}