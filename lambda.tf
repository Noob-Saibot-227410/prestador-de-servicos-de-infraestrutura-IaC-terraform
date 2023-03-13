# Configuração do provedor AWS
provider "aws" {
  region = "us-east-1"
}

# Criação da função AWS Lambda
resource "aws_lambda_function" "example" {
  function_name = "example-lambda"
  handler      = "index.handler"
  runtime      = "nodejs14.x"
  role         = aws_iam_role.example.arn

  # Código da função AWS Lambda
  filename = "example.zip"
  source_code_hash = filebase64sha256("example.zip")

  # Configuração do ambiente da função AWS Lambda
  environment {
    variables = {
      "EXAMPLE_VARIABLE" = "example-value"
    }
  }

  # Configuração do trigger do evento da função AWS Lambda
  # Aqui está um exemplo de gatilho para um bucket S3
  event_source_token = aws_s3_bucket_notification.example.lambda_function_arn
  events             = ["s3:ObjectCreated:*"]

  # Configuração das opções da função AWS Lambda
  timeout = 60
  memory_size = 128
}

# Criação da política IAM para a função AWS Lambda
resource "aws_iam_policy" "example" {
  name        = "example-lambda-policy"
  policy      = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ]
        Effect   = "Allow"
        Resource = "arn:aws:logs:*:*:*"
      }
    ]
  })
}

# Criação do papel IAM para a função AWS Lambda
resource "aws_iam_role" "example" {
  name = "example-lambda-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })

  # Anexando a política IAM à função AWS Lambda
  # Isso permite que a função acesse outros recursos da AWS
  # com base na permissão fornecida pela política
  # Neste exemplo, permitimos o acesso aos logs da AWS CloudWatch
  depends_on = [aws_iam_policy.example]
  policy     = aws_iam_policy.example.policy
}

# Criação de uma notificação de bucket S3
resource "aws_s3_bucket_notification" "example" {
  bucket = "example-bucket"

  lambda_function {
    lambda_function_arn = aws_lambda_function.example.arn
    events              = ["s3:ObjectCreated:*"]
    filter_suffix       = ".txt"
  }
}
