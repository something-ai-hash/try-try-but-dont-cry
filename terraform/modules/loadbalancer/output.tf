output "target_group_arn" {
    value = aws_alb_target_group.main.arn
}

output "lb_security_group_id" {
    value = aws_security_group.alb.id
}