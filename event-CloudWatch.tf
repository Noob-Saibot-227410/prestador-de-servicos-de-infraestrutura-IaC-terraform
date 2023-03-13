# Configuração do provedor AWS
provider "aws" {
  region = "us-east-1"
}

# Criação do log group do CloudWatch
resource "aws_cloudwatch_log_group" "example" {
  name = "example_log_group"
  retention_in_days = 7
}

# Exibição do nome do log group do CloudWatch
output "log_group_name" {
  value = aws_cloudwatch_log_group.example.name
}
