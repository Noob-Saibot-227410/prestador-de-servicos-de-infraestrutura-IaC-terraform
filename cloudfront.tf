# Configuração do provedor AWS
provider "aws" {
  region = "us-east-1"
}

# Criação da distribuição do Amazon CloudFront
resource "aws_cloudfront_distribution" "example" {
  # Configurações básicas da distribuição
  enabled             = true
  comment             = "Example CloudFront Distribution"
  default_root_object = "index.html"
  price_class         = "PriceClass_All"

  # Configurações de cache da distribuição
  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "example-s3-origin"

    forward_headers {
      quantity = 1
      headers  = ["Authorization"]
    }

    forwarded_values {
      query_string = true
      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  ordered_cache_behavior {
    path_pattern     = "/api/*"
    allowed_methods  = ["GET", "HEAD", "OPTIONS"]
    cached_methods   = ["GET", "HEAD", "OPTIONS"]
    target_origin_id = "example-api-gateway-origin"

    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 0
    max_ttl                = 0
  }

  # Configurações de origem da distribuição
  origin {
    domain_name = aws_s3_bucket.example.bucket_regional_domain_name
    origin_id   = "example-s3-origin"
    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.example.cloudfront_access_identity_path
    }
  }

  origin {
    domain_name = aws_api_gateway_deployment.example.invoke_url
    origin_id   = "example-api-gateway-origin"
    custom_origin_config {
      http_port              = 80
      https_port             = 443
      origin_protocol_policy = "https-only"
    }
  }

  # Configurações de certificado SSL da distribuição
  viewer_certificate {
    acm_certificate_arn = aws_acm_certificate.example.arn
    ssl_support_method  = "sni-only"
    minimum_protocol_version = "TLSv1.2_2018"
  }
}

# Criação do certificado SSL da distribuição
resource "aws_acm_certificate" "example" {
  domain_name = "example.com"
  validation_method = "DNS"
}

# Criação do registro DNS para a validação do certificado SSL
resource "aws_route53_record" "example_validation" {
  name = aws_acm_certificate_validation.example.domain_validation_options.0.resource_record_name
  type = aws_acm_certificate_validation.example.domain_validation_options.0.resource_record_type
  zone_id = aws_route53_zone.example.zone_id
  records = [aws_acm_certificate_validation.example.domain_validation_options.0.resource_record_value]
  ttl = 60
}

# Validação do certificado SSL da distribuição
resource "aws_acm_certificate_validation" "example" {
  certificate_arn = aws_acm_certificate.example.arn
  validation_record_fqdns = [aws_route53_record.example_validation.fqdn]
}

# Criação do identidade de acesso à origem do CloudFront
resource "aws_cloudfront_origin_access_identity" "example" {
  comment = "Example CloudFront Origin Access Identity"
}

# Criação da permissão de acesso do CloudFront à origem S3
resource "aws_s3_bucket_policy" "example" {
  bucket = aws_s3_bucket.example.id
  policy = jsonencode({
    Version = "2012-10-17",
    Id = "PolicyForCloudFrontPrivateContent",
    Statement = [
      {
        Sid = "Grant a CloudFront Origin Identity access to support private content",
        Effect = "Allow",
        Principal = {
          AWS = "arn:aws:iam::cloudfront:user/CloudFront Origin Access Identity ${aws_cloudfront_origin_access_identity.example.iam_arn}"
        },
        Action = "s3:GetObject",
        Resource = "${aws_s3_bucket.example.arn}/*"
      }
    ]
  })
}

# Criação do registro DNS da distribuição do CloudFront
resource "aws_route53_record" "example" {
  name = "example.com"
  type = "A"
  alias {
    name = aws_cloudfront_distribution.example.domain_name
    zone_id = aws_cloudfront_distribution.example.hosted_zone_id
    evaluate_target_health = true
  }
}

# Criação da política de segurança para o CloudFront
resource "aws_cloudfront_origin_access_identity_policy" "example" {
  # ARN da identidade de acesso à origem
  # (usado para gerar o valor da política)
  identity = aws_cloudfront_origin_access_identity.example.iam_arn

  # Definição da política
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid = "1",
        Effect = "Allow",
        Principal = {
          AWS = "*"
        },
        Action = "s3:GetObject",
        Resource = "arn:aws:s3:::example/*"
      }
    ]
  })
}

# Criação do grupo de segurança para o CloudFront
resource "aws_security_group" "example" {
  name_prefix = "example-cloudfront-"
  description = "Security group for the example CloudFront distribution"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}