output "aws_cloudwatch_event_rule" {
    value = aws_cloudwatch_event_rule.codecommit_event.id
}