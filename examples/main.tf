provider "aws" {
  region     = "us-east-1"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

module "nexus" {
  source                            = "../module/"
  vpc_id                            = var.vpc_id
  namespace                         = "eg"
  name                              = "app"
  stage                             = "test"
  attributes                        = ["xyz"]
  private_subnet_id1                = var.private_subnet_id1
  private_subnet_id2                = var.private_subnet_id2
  public_subnet_id1                 = var.public_subnet_id1
  public_subnet_id2                 = var.public_subnet_id2
  dns_name                          = var.dns_name
  registry_domain_name              = var.registry_domain_name
  docker_domain_name                = var.docker_domain_name
  zone_id                           = var.zone_id
  ssh_key_name                      = var.ssh_key_name
  nexus_application_ami             = var.nexus_ami
  nexus_kms_alias                   = var.nexus_kms_alias
  nexus_npm_registry_s3_bucket      = var.nexus_npm_registry_s3_bucket
  nexus_npm_private_s3_bucket       = var.nexus_npm_private_s3_bucket
  nexus_npm_group_s3_bucket         = var.nexus_npm_group_s3_bucket
  nexus_maven_snapshots_s3_bucket   = var.nexus_maven_snapshots_s3_bucket
  nexus_maven_releases_s3_bucket    = var.nexus_maven_releases_s3_bucket
  nexus_maven_group_s3_bucket       = var.nexus_maven_group_s3_bucket
  nexus_maven_central_s3_bucket     = var.nexus_maven_central_s3_bucket
  nexus_docker_private_s3_bucket    = var.nexus_docker_private_s3_bucket
  nexus_docker_hub_s3_bucket_name   = var.nexus_docker_hub_s3_bucket_name
  nexus_docker_group_s3_bucket      = var.nexus_docker_group_s3_bucket
}