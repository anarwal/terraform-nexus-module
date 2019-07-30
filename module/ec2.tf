resource "aws_instance" "nexus" {
  ami                         = var.nexus_application_ami
  instance_type               = "t2.xlarge"
  subnet_id                   = data.aws_subnet.private_selected.id
  vpc_security_group_ids      = flatten([aws_security_group.internal_ssh.id])
  key_name                    = var.ssh_key_name
  user_data                   = data.template_cloudinit_config.config.rendered
  associate_public_ip_address = false
  monitoring                  = true
  volume_tags                 = { "Name" = format("%s-nexus-instance-ebs", module.nexus_label.name), "Environment" = module.nexus_label.stage}
  tags                        = { "Name" = format("%s-nexus-instance", module.nexus_label.name), "Environment" = module.nexus_label.stage}
}

resource "aws_eip" "nexus_eip" {
  instance = "${aws_instance.nexus.id}"
  vpc      = true
}



output "nexus_public_ip" {
  value = "${aws_instance.nexus.public_ip}"
}