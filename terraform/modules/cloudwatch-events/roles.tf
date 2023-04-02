
resource "aws_iam_role" "codebuild-invoke" {
  description = "codebuild invoke role"
  name        = "${var.environment}-codebuild-invoke-role"

  assume_role_policy = jsonencode(
    {
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": "events.amazonaws.com"
            },
            "Action": "sts:AssumeRole"
        }
    ]
    }
  )

  inline_policy {
    name = "codebuild_invoke_policy"
    policy = data.aws_iam_policy_document.codebuild-invoke.json
  }
}

data "aws_iam_policy_document" "codebuild-invoke" {
  
  statement {
    sid = "codebuildinvokerole"
    actions = [
      "codebuild:StartBuild",
    ]

    resources = [
      "${var.codebuild_project_arn}",
    ]
  }
}