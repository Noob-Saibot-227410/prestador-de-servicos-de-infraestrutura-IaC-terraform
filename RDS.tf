# Configuração do provedor AWS
provider "aws" {
  region = "us-east-1"
}

# Criação da instância do RDS
resource "aws_db_instance" "example" {
  engine = "mysql"
  instance_class = "db.t2.micro"
  allocated_storage = 10
  identifier = "example-db"
  name = "example-db"
  username = "exampleuser"
  password = "examplepassword"
  parameter_group_name = "default.mysql5.7"
  backup_retention_period = 7
  maintenance_window = "Mon:00:00-Mon:01:00"
  vpc_security_group_ids = [
    aws_security_group.example.id
  ]
  tags = {
    Name = "example-db"
  }
}

# Criação do security group do RDS
resource "aws_security_group" "example" {
  name_prefix = "example-"
  ingress {
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }
  tags = {
    Name = "example-sg"
  }
}

# Exibição do endpoint do RDS
output "endpoint" {
  value = aws_db_instance.example.endpoint
}
