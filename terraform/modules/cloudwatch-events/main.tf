resource "aws_cloudwatch_event_rule" "codecommit_event" {
  name        = "${var.environment}-event-rule"
  description = "rule for codecommit repo changes"
  
  event_pattern = jsonencode({
    "source": ["aws.codecommit"],
    "detail-type": ["CodeCommit Repository State Change"],
    "resources": ["arn:aws:codecommit:${var.region}:${var.account_id}:${var.codecommit_repo_name}"],
    "detail": {
      "referenceType": ["branch"],
      "referenceName": ["master"]
    }
  })
}

resource "aws_cloudwatch_event_target" "codebuild_target" {
  rule      = aws_cloudwatch_event_rule.codecommit_event.name
  arn       = var.codebuild_project_arn
  role_arn  = aws_iam_role.codebuild-invoke.arn
}

