resource "aws_route53_record" "nexus_alb_dns" {
  zone_id = var.zone_id
  name    = var.registry_domain_name
  type    = "A"
  alias {
    name                   = aws_lb.nexus_alb.dns_name
    zone_id                = aws_lb.nexus_alb.zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "nexus_docker_alb_dns" {
  zone_id = var.zone_id
  name    = var.docker_domain_name
  type    = "A"
  alias {
    name                   = aws_lb.nexus_docker_alb.dns_name
    zone_id                = aws_lb.nexus_docker_alb.zone_id
    evaluate_target_health = false
  }
}