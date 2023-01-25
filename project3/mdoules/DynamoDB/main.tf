resource "aws_dynamodb_table" "basic-dynamodb-table" {
  name           = var.name
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = var.hash_key
  attribute {
    name = var.hash_key
    type = "S"
  }  
}

# Dynamo_db is used as locking table.
