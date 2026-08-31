output "endpoint" {
  value     = aws_db_instance.this.endpoint
  sensitive = true
}

output "credentials_secret_arn" {
  value = aws_secretsmanager_secret.db_credentials.arn
}
