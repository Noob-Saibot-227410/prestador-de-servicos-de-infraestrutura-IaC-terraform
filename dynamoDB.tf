# Configuração do provedor AWS
provider "aws" {
  region = "us-east-1"
}

# Criação da tabela do DynamoDB
resource "aws_dynamodb_table" "example" {
  name = "example_table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key = "id"
  attribute {
    name = "id"
    type = "S"
  }
  attribute {
    name = "name"
    type = "S"
  }
  attribute {
    name = "age"
    type = "N"
  }
}

# Exibição do nome da tabela do DynamoDB
output "table_name" {
  value = aws_dynamodb_table.example.name
}
