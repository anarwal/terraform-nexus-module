resource "aws_instance" "nexus_bastion" {
  instance_type          = "t2.micro"
  subnet_id              = data.aws_subnet.public_selected1.id
  vpc_security_group_ids = [aws_security_group.nexus_external_ssh.id]
  key_name               = var.ssh_key_name
  ami                    = data.aws_ami.centos.id
  volume_tags            = { "Name" = format("%s-nexus_bastion-ebs", module.nexus_label.name), "Environment" = module.nexus_label.stage}
  tags                   = { "Name" = format("%s-nexus_bastion", module.nexus_label.name), "Environment" = module.nexus_label.stage}
}

resource "aws_eip" "nexus_bastion" {
  instance = aws_instance.nexus_bastion.id
  vpc      = true
  tags     = { "Name" = format("%s-nexus_bastion-eip", module.nexus_label.name), "Environment"= module.nexus_label.stage}
}
