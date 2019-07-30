resource "aws_instance" "bastion" {
  instance_type          = "t2.micro"
  subnet_id              = data.aws_subnet.public_selected.id
  vpc_security_group_ids = [aws_security_group.external_ssh.id]
  key_name               = var.ssh_key_name
  ami                    = data.aws_ami.centos.id
  volume_tags            = { "Name" = format("%s-bastion-ebs", module.nexus_label.name), "Environment" = module.nexus_label.stage}
tags                   = { "Name" = format("%s-bastion", module.nexus_label.name), "Environment" = module.nexus_label.stage}
}

resource "aws_eip" "bastion" {
instance = aws_instance.bastion.id
vpc      = true
tags     = { "Name" = format("%s-bastion-eip", module.nexus_label.name), "Environment"= module.nexus_label.stage}
}
