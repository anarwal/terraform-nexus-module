resource "aws_ebs_volume" "nexus_data" {
  size              = var.nexus_data_disk_size
  kms_key_id        = aws_kms_key.nexus_kms_key.arn
  encrypted         = true
  type              = "gp2"
  availability_zone = data.aws_subnet.private_selected1.availability_zone
  tags              = { "Name" = format("%s-nexus-data-disk",module.nexus_label.name), "Type" = "nexus-data" }
}

resource "aws_volume_attachment" "nexus_data_attachment" {
  device_name = var.nexus_data_device_name
  volume_id   = aws_ebs_volume.nexus_data.id
  instance_id = aws_instance.nexus_application.id
  force_detach = true
}