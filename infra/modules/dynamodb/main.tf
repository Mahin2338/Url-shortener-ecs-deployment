resource "aws_dynamodb_table" "url-shortener" {
  name             = "url-shortener"
  hash_key         = "id"
  billing_mode     = "PAY_PER_REQUEST"


  attribute {
    name = "id"
    type = "S"
  }

  point_in_time_recovery {
    enabled = true
  }

  tags = {
    Name = "url-shortener-table"
  }
}