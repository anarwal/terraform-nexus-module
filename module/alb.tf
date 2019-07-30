resource "aws_lb" "nexus_alb" {
  load_balancer_type = "application"
  idle_timeout       = var.nexus_alb_ideal_timeout
  internal           = false
  security_groups    = [aws_security_group.nexus_alb.id]
  ip_address_type    = "ipv4"
  subnets            = var.public_subnet_id
  tags               = {"Name" = format("%s-nexus-alb", module.nexus_label.name), "Environment" = module.nexus_label.stage}
}

resource "aws_lb_target_group" "nexus_alb_tg" {
port                 = 443
protocol             = "HTTPS"
vpc_id               = var.vpc_id
tags                 = {"Name" = format("%s-nexus-alb-tg", module.nexus_label.name), "Environment" = module.nexus_label.stage}
health_check {
port                = "traffic-port"
protocol            = "HTTPS"
interval            = 30
path                = "/explore"
timeout             = 15
healthy_threshold   = 3
unhealthy_threshold = 10
matcher             = 200
}
}

resource "aws_lb_listener" "nexus_alb_https_listener" {
load_balancer_arn = aws_lb.nexus_alb.arn
port              = 443
protocol          = "HTTPS"
ssl_policy        = "ELBSecurityPolicy-2016-08"
certificate_arn   = aws_acm_certificate.nexus_cert.arn
default_action {
target_group_arn = aws_lb_target_group.nexus_alb_tg.arn
type             = "forward"
}
}

resource "aws_lb_target_group_attachment" "nexus_alb_tg_attachment" {
target_group_arn = aws_lb_target_group.nexus_alb_tg.arn
target_id        = aws_instance.nexus_application.id
port             = 443
}