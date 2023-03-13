# Configuração do provedor AWS
provider "aws" {
  region = "us-east-1"
}

# Criação do cluster do ECS
resource "aws_ecs_cluster" "example" {
  name = "example-ecs-cluster"
}

# Criação de uma definição de tarefa (task definition)
resource "aws_ecs_task_definition" "example" {
  family                   = "example-task-family"
  container_definitions    = <<DEFINITION
  [
    {
      "name": "example-container",
      "image": "nginx",
      "portMappings": [
        {
          "containerPort": 80,
          "hostPort": 80
        }
      ],
      "essential": true
    }
  ]
  DEFINITION
}

# Criação de um serviço (service) no cluster do ECS
resource "aws_ecs_service" "example" {
  name            = "example-ecs-service"
  cluster         = aws_ecs_cluster.example.arn
  task_definition = aws_ecs_task_definition.example.arn
  desired_count   = 2

  network_configuration {
    security_groups = [aws_security_group.example.id]
    subnets         = [aws_subnet.example.id]
  }
}

# Criação de um grupo de segurança para permitir o tráfego HTTP na porta 80
resource "aws_security_group" "example" {
  name_prefix = "example-ecs-"
}

resource "aws_security_group_rule" "example_ingress_http" {
  type        = "ingress"
  from_port   = 80
  to_port     = 80
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.example.id
}

# Criação de uma sub-rede para o serviço do ECS
resource "aws_subnet" "example" {
  vpc_id            = aws_vpc.example.id
  cidr_block        = "10.0.0.0/24"
  availability_zone = "us-east-1a"
}

# Criação de um VPC para o cluster do ECS
resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "example-ecs-vpc"
  }
}
