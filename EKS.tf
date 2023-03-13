# Configuração do provedor AWS
provider "aws" {
  region = "us-east-1"
}

# Criação do VPC para o cluster do EKS
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  name = "eks-vpc"
  cidr = "10.0.0.0/16"
  azs = ["us-east-1a", "us-east-1b", "us-east-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
  enable_nat_gateway = true
  single_nat_gateway = true
}

# Criação do cluster do EKS
module "eks_cluster" {
  source = "terraform-aws-modules/eks/aws"
  cluster_name = "example-eks-cluster"
  subnets = module.vpc.public_subnets
  tags = {
    Terraform = "true"
    Environment = "dev"
  }
  vpc_id = module.vpc.vpc_id
  map_roles = true
}

# Configuração do kubectl
data "aws_eks_cluster" "cluster" {
  name = module.eks_cluster.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks_cluster.cluster_id
}

provider "kubernetes" {
  host = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority[0].data)
  token = data.aws_eks_cluster_auth.cluster.token
}

# Exibição do endpoint do cluster do EKS
output "cluster_endpoint" {
  value = module.eks_cluster.endpoint
}
