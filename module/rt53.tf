resource "aws_route53_record" "nexus_dns" {
  zone_id = "${var.dns_zone_id}"
  name    = "${var.nexus_dns_name}"
  type    = "A"
  ttl     = "300"
  records = ["${aws_eip.nexus_eip.public_ip}"]
}