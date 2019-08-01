resource "aws_s3_bucket" "nexus_docker_group_s3_bucket" {
bucket        = format("%s-%s",module.nexus_label.id, var.nexus_docker_group_s3_bucket)
acl           = "private"
force_destroy = var.force_destroy_s3_bucket

server_side_encryption_configuration {
rule {
apply_server_side_encryption_by_default {
sse_algorithm = "AES256"
}
}
}

versioning {
enabled = true
}

tags = merge(module.nexus_label.tags,  {"Bucket-Name" = format("%s-%s",module.nexus_label.id, var.nexus_docker_group_s3_bucket)})
}

resource "aws_s3_bucket" "nexus_docker_hub_s3_bucket" {
  bucket        = format("%s-%s",module.nexus_label.id, var.nexus_docker_hub_s3_bucket_name)
  acl           = "private"
  force_destroy = var.force_destroy_s3_bucket

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  versioning {
    enabled = true
  }

  tags = merge(module.nexus_label.tags,  {"Bucket-Name" = format("%s-%s",module.nexus_label.id, var.nexus_docker_hub_s3_bucket_name)})
}

resource "aws_s3_bucket" "nexus_docker_private_s3_bucket" {
  bucket        = format("%s-%s",module.nexus_label.id, var.nexus_docker_private_s3_bucket)
  acl           = "private"
  force_destroy = var.force_destroy_s3_bucket

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  versioning {
    enabled = true
  }

  tags = merge(module.nexus_label.tags,  {"Bucket-Name" = format("%s-%s",module.nexus_label.id, var.nexus_docker_private_s3_bucket)})
}

resource "aws_s3_bucket" "nexus_maven_central_s3_bucket" {
  bucket        = format("%s-%s",module.nexus_label.id, var.nexus_maven_central_s3_bucket)
  acl           = "private"
  force_destroy = var.force_destroy_s3_bucket

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  versioning {
    enabled = true
  }

  tags = merge(module.nexus_label.tags,  {"Bucket-Name" = format("%s-%s",module.nexus_label.id, var.nexus_maven_central_s3_bucket)})
}

resource "aws_s3_bucket" "nexus_maven_group_s3_bucket" {
  bucket        = format("%s-%s",module.nexus_label.id, var.nexus_maven_group_s3_bucket)
  acl           = "private"
  force_destroy = var.force_destroy_s3_bucket

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  versioning {
    enabled = true
  }

  tags = merge(module.nexus_label.tags,  {"Bucket-Name" = format("%s-%s",module.nexus_label.id, var.nexus_maven_group_s3_bucket)})
}

resource "aws_s3_bucket" "nexus_maven_releases_s3_bucket" {
  bucket        = format("%s-%s",module.nexus_label.id, var.nexus_maven_releases_s3_bucket)
  acl           = "private"
  force_destroy = var.force_destroy_s3_bucket

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  versioning {
    enabled = true
  }

  tags = merge(module.nexus_label.tags,  {"Bucket-Name" = format("%s-%s",module.nexus_label.id, var.nexus_maven_releases_s3_bucket)})
}

resource "aws_s3_bucket" "nexus_maven_snapshots_s3_bucket" {
  bucket        = format("%s-%s",module.nexus_label.id, var.nexus_maven_snapshots_s3_bucket)
  acl           = "private"
  force_destroy = var.force_destroy_s3_bucket

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  versioning {
    enabled = true
  }

  tags = merge(module.nexus_label.tags,  {"Bucket-Name" = format("%s-%s",module.nexus_label.id, var.nexus_maven_snapshots_s3_bucket)})
}

resource "aws_s3_bucket" "nexus_npm_group_s3_bucket" {
  bucket        = format("%s-%s",module.nexus_label.id, var.nexus_npm_group_s3_bucket)
  acl           = "private"
  force_destroy = var.force_destroy_s3_bucket

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  versioning {
    enabled = true
  }

  tags = merge(module.nexus_label.tags,  {"Bucket-Name" = format("%s-%s",module.nexus_label.id, var.nexus_npm_group_s3_bucket)})
}

resource "aws_s3_bucket" "nexus_npm_private_s3_bucket" {
  bucket        = format("%s-%s",module.nexus_label.id, var.nexus_npm_private_s3_bucket)
  acl           = "private"
  force_destroy = var.force_destroy_s3_bucket

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  versioning {
    enabled = true
  }

  tags = merge(module.nexus_label.tags,  {"Bucket-Name" = format("%s-%s",module.nexus_label.id, var.nexus_npm_private_s3_bucket)})
}

resource "aws_s3_bucket" "nexus_npm_registry_s3_bucket" {
  bucket        = format("%s-%s",module.nexus_label.id, var.nexus_npm_registry_s3_bucket)
  acl           = "private"
  force_destroy = var.force_destroy_s3_bucket

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  versioning {
    enabled = true
  }

  tags = merge(module.nexus_label.tags,  {"Bucket-Name" = format("%s-%s",module.nexus_label.id, var.nexus_npm_registry_s3_bucket)})
}