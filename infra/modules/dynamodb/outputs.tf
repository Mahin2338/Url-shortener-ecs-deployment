output "dynamodb_table_name" {
  value = aws_dynamodb_table.url-shortener.name
}

output "dynamodb_table_arn" {
  value = aws_dynamodb_table.url-shortener.arn
}