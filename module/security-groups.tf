resource "aws_security_group" "nexus_internal_ssh" {
  name_prefix = format("%s-%s-nexus-internal-ssh-", module.nexus_label.name, module.nexus_label.stage)
  description = "Allows ssh from bastion"
  vpc_id      = var.vpc_id
  tags        = { "Name" = format("%s-nexus-internal-ssh",module.nexus_label.name),"Environment" = module.nexus_label.stage }

  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.nexus_external_ssh.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group" "nexus_external_ssh" {
  name_prefix = format("%s-%s-nexus-external-ssh-", module.nexus_label.name, module.nexus_label.stage)
  description = "Allows ssh from the world"
  vpc_id      = var.vpc_id
  tags        = { "Name" = format("%s-nexus-external-ssh",module.nexus_label.name), "Environment" = module.nexus_label.stage }


  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  lifecycle {
    create_before_destroy = true
  }
}


resource "aws_security_group" "nexus_alb" {
  name_prefix = format("%s-%s-external-alb-", module.nexus_label.name, module.nexus_label.stage)
  description = "Security group to allow all inbound web traffic from world to Load balancer"
  vpc_id      = var.vpc_id
  tags        = { "Name" = format("%s-nexus-alb-instance",module.nexus_label.name), "Environment" = module.nexus_label.stage }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group" "internal_nexus" {
  name_prefix = format("%s-%s-internal-nexus-", module.nexus_label.name, module.nexus_label.stage)
  description = "Security group to allow all inbound web traffic from Load balancer to nexus application"
  vpc_id      = var.vpc_id
  tags        = { "Name" = format("%s-internal-nexus-instance",module.nexus_label.name), "Environment"= module.nexus_label.stage }

  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.nexus_alb.id]
  }

  ingress {
    from_port       = 8081
    to_port         = 8081
    protocol        = "tcp"
    security_groups = [aws_security_group.nexus_alb.id]
  }

  ingress {
    from_port       = 443
    to_port         = 443
    protocol        = "tcp"
    security_groups = [aws_security_group.nexus_alb.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  lifecycle {
    create_before_destroy = true
  }
}