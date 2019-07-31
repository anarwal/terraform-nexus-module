resource "aws_acm_certificate" "nexus_cert" {
  domain_name       = var.domain_name
  validation_method = "DNS"
  tags              = module.nexus_label.tags

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_acm_certificate_validation" "nexus_cert_validation" {
  certificate_arn         = aws_acm_certificate.nexus_cert.arn
  validation_record_fqdns = [aws_route53_record.nexus_cert_validation.fqdn]
}