# Configuração do provedor AWS
provider "aws" {
  region = "us-east-1"
}

# Criação do recurso EC2
resource "aws_instance" "example" {
  ami           = "ami-0c94855ba95c71c99"   # ID da AMI do Amazon Linux 2
  instance_type = "t2.micro"                # Tipo de instância
  key_name      = "my_key_pair"             # Nome da chave SSH
  security_groups = ["my_security_group"]   # Grupo de segurança
  tags = {
    Name = "Example EC2 Instance"
  }

  # Definição do bloco de inicialização para instalar o Apache
  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd
              EOF
}

# Exibição do endereço IP público da instância EC2
output "public_ip" {
  value = aws_instance.example.public_ip
}
