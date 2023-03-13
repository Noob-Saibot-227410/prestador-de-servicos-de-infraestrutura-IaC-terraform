# Configuração do provedor AWS
provider "aws" {
  region = "us-east-1"
}

# Criação da fila do SQS
resource "aws_sqs_queue" "example" {
  name = "example_queue"
  delay_seconds = 90
  max_size = 1024
  message_retention_seconds = 86400
  visibility_timeout_seconds = 120
  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.example_dlq.arn
    maxReceiveCount = 3
  })
}

# Criação da fila de dead letter do SQS
resource "aws_sqs_queue" "example_dlq" {
  name = "example_dlq"
}

# Exibição do ARN da fila do SQS
output "queue_arn" {
  value = aws_sqs_queue.example.arn
}
