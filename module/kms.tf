resource "aws_kms_key" "nexus_kms_key" {
  description             = "Nexus KMS key"
  deletion_window_in_days = 10
  tags                    = module.nexus_label.tags
  enable_key_rotation     = var.enable_key_rotation
}

resource "aws_kms_alias" "nexus_kms_key_alias" {
  name          = coalesce(var.nexus_kms_alias, format("alias/%v", module.nexus_label.id))
  target_key_id = aws_kms_key.nexus_kms_key.key_id
}