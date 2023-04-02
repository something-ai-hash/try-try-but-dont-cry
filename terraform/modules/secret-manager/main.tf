resource "aws_secretsmanager_secret" "secrets" {
  name        = "${var.environment}-secrets"
  description = "store credentials for further use"
  tags = {
    Name        = "${var.environment}-secrets"
  }
}

# Storing db credentials
resource "aws_secretsmanager_secret_version" "sversion" {
  secret_id = aws_secretsmanager_secret.secrets.id
  secret_string = <<EOF
   {
    "dbhost": "${var.dbhost}",
    "dbuser": "${var.dbuser}",
    "dbpassword": "${var.dbpassword}",
    "dbname": "${var.dbname}"
   }
EOF
}