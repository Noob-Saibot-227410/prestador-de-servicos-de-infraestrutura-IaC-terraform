# Define as credenciais da AWS
provider "aws" {
  region     = "us-west-2"
  access_key = "YOUR_ACCESS_KEY"
  secret_key = "YOUR_SECRET_KEY"
}

# Define as especificações do servidor EC2
resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
}

# Exibe o IP público do servidor EC2 criado
output "public_ip" {
  value = aws_instance.example.public_ip
}
