
resource "aws_iam_role" "codebuild" {
  description = "codebuild service role"
  name        = "${var.environment}-codebuild-role"

  assume_role_policy = jsonencode(
    {
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Effect" : "Allow",
          "Principal" : {
            "Service" : "codebuild.amazonaws.com"
          },
          "Action" : "sts:AssumeRole"
        }
      ]
    }
  )

  inline_policy {
    name = "codebuild_execute_policy"
    policy = data.aws_iam_policy_document.codebuild.json
  }
}

data "aws_iam_policy_document" "codebuild" {
  statement {
    sid = "SSOCodebuildAllow"

    actions = [
      "s3:*",
      "kms:*",
      "ssm:*",
    ]

    resources = [
      "*",
    ]
  }

  statement {
    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
    ]

    resources = [
      "*",
    ]
  }

  statement {
    actions = [
      "sso:ListInstances",
      "sso:DescribePermissionSet",
      "sso:ListTagsForResource",
      "sso:GetInlinePolicyForPermissionSet",
      "sso:ListAccountAssignments",
      "sso:CreateAccountAssignment",
      "sso:DescribeAccountAssignmentCreationStatus",
      "sso:DeleteAccountAssignment",
      "sso:DescribeAccountAssignmentDeletionStatus",
      "sso:CreatePermissionSet",
      "sso:PutInlinePolicyToPermissionSet",
      "sso:ProvisionPermissionSet",
      "sso:DeleteInlinePolicyFromPermissionSet",
      "sso:DescribePermissionSetProvisioningStatus",
      "sso:DeletePermissionSet",
    ]

    resources = [
      "*",
    ]
  }

  statement {
    actions = [
      "identitystore:ListGroups",
    ]

    resources = [
      "*",
    ]
  }

  statement {
    actions = [
         "ecr:GetAuthorizationToken",
          "ecr:BatchCheckLayerAvailability",
          "ecr:CompleteLayerUpload",
          "ecr:InitiateLayerUpload",
          "ecr:PutImage",
          "ecr:UploadLayerPart",
    ]

    resources = [
      "*",
    ]
  }

  statement {
    actions = [
         "codecommit:*"
    ]

    resources = [
      "*",
    ]

  }
}