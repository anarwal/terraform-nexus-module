data "aws_subnet" "private_selected" {
  id = var.private_subnet_id
}

data "aws_subnet" "public_selected1" {
  id = var.public_subnet_id1
}

data "aws_subnet" "public_selected2" {
  id = var.public_subnet_id2
}

# Use this data source to get the access to the effective Account ID, User ID, and ARN in which Terraform is authorized.
data "aws_caller_identity" "current" {}

data "aws_ami" "centos" {
  most_recent = true

  filter {
  name   = "virtualization-type"
  values = ["hvm"]
  }

  filter {
  name   = "product-code"
  values = ["aw0evgkw8e5c1q413zgy5pjce"]
  }

  owners = ["aws-marketplace"]
}

data "template_file" "nexus_application_user_data" {
  template = "${file("${path.module}/templates/init.sh")}"

  vars = {
    nexus_data_device_name     = var.nexus_data_device_name
    nexus_data_directory       = var.nexus_data_directory
  }
}

data "template_cloudinit_config" "config" {
  part {
  content_type = "text/x-shellscript"
  content      = "${data.template_file.nexus_application_user_data.rendered}"
  }
}
