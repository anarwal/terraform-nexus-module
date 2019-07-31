resource "aws_route53_record" "nexus_cert_validation" {
  name    = aws_acm_certificate.nexus_cert.domain_validation_options.0.resource_record_name
  type    = aws_acm_certificate.nexus_cert.domain_validation_options.0.resource_record_type
  zone_id = var.zone_id
  records = [aws_acm_certificate.nexus_cert.domain_validation_options.0.resource_record_value]
  ttl     = 300
}

resource "aws_route53_record" "nexus_alb_dns" {
  zone_id = var.zone_id
  name    = var.domain_name
  type    = "A"
  alias {
    name                   = aws_lb.nexus_alb.dns_name
    zone_id                = aws_lb.nexus_alb.zone_id
    evaluate_target_health = false
  }
}