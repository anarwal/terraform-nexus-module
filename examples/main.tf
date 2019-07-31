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
  private_subnet_id                 = var.private_subnet_id
  public_subnet_id                  = var.public_subnet_id
  domain_name                       = var.domain_name
  zone_id                           = var.zone_id
  ssh_key_name                      = var.ssh_key_name
  nexus_application_ami             = var.nexus_ami
  nexus_kms_alias                   = var.nexus_kms_alias
}