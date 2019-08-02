output "nexus_s3_secret_key" {
  value = aws_iam_access_key.nexus_s3_access_key.secret
}

output "nexus_s3_access_key" {
  value = aws_iam_access_key.nexus_s3_access_key.id
}

output "user_arn" {
  value = aws_iam_user.nexus_s3_user.arn
}

output "sg_nexus_internal_ssh_name" {
  value = aws_security_group.nexus_internal_ssh.name
}

output "sg_nexus_internal_ssh_ingress" {
  value = aws_security_group.nexus_internal_ssh.ingress
}

output "sg_nexus_external_ssh_name" {
  value = aws_security_group.nexus_external_ssh.name
}

output "sg_nexus_external_ssh_ingress" {
  value = aws_security_group.nexus_external_ssh.ingress
}

output "sg_nexus_alb_name" {
  value = aws_security_group.nexus_alb.name
}

output "sg_nexus_alb_ingress" {
  value = aws_security_group.nexus_alb.ingress
}

output "sg_internal_nexus_name" {
  value = aws_security_group.internal_nexus.name
}

output "sg_internal_nexus_ingress" {
  value = aws_security_group.internal_nexus.ingress
}

output "nexus_route53_nexus_alb" {
  value = aws_route53_record.nexus_alb_dns.fqdn
}

output "nexus_bastion_public_eip" {
  value = aws_eip.nexus_bastion.public_ip
}

output "nexus_private_ip" {
  value = aws_instance.nexus_application.private_ip
}

output "nexus_npm_registry_s3_bucket_name" {
  value = aws_s3_bucket.nexus_npm_registry_s3_bucket.bucket
}

output "nexus_npm_private_s3_bucket_name" {
  value = aws_s3_bucket.nexus_npm_private_s3_bucket.bucket
}

output "nexus_npm_group_s3_bucket_name" {
  value = aws_s3_bucket.nexus_npm_group_s3_bucket.bucket
}

output "nexus_maven_snapshots_s3_bucket_name" {
  value = aws_s3_bucket.nexus_maven_snapshots_s3_bucket.bucket
}

output "nexus_maven_releases_s3_bucket_name" {
  value = aws_s3_bucket.nexus_maven_releases_s3_bucket.bucket
}

output "nexus_maven_group_s3_bucket_name" {
  value = aws_s3_bucket.nexus_maven_group_s3_bucket.bucket
}

output "nexus_maven_central_s3_bucket_name" {
  value = aws_s3_bucket.nexus_maven_central_s3_bucket.bucket
}

output "nexus_docker_private_s3_bucket_name" {
  value = aws_s3_bucket.nexus_docker_private_s3_bucket.bucket
}

output "nexus_docker_hub_s3_bucket_name" {
  value = aws_s3_bucket.nexus_docker_hub_s3_bucket.bucket
}

output "nexus_docker_group_s3_bucket_name" {
  value = aws_s3_bucket.nexus_docker_group_s3_bucket.bucket
}
