output "aws_secret_arn" {
  description = "The database endpoint for connection"
  value       = aws_secretsmanager_secret.secrets.arn
}

output "aws_secret_name" {
  description  = "secret name"
  value        = aws_secretsmanager_secret.secrets.name
}
