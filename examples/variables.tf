variable "aws_access_key" {
  default = ""
}

variable "aws_secret_key" {
  default = ""
}

variable "vpc_id" {
}

variable "public_subnet_id1" {
}

variable "public_subnet_id2" {
}

variable "private_subnet_id1" {
}

variable "private_subnet_id2" {
}

variable "dns_name" {
}

variable "registry_domain_name" {
}

variable "docker_domain_name" {
}

variable "zone_id" {
}

variable "nexus_ami" {
}

variable "ssh_key_name"{
}

variable "nexus_kms_alias" {
}

variable "nexus_npm_registry_s3_bucket" {
}

variable "nexus_npm_private_s3_bucket" {
}

variable "nexus_npm_group_s3_bucket" {
}

variable "nexus_maven_snapshots_s3_bucket" {
}

variable "nexus_maven_releases_s3_bucket" {
}

variable "nexus_maven_group_s3_bucket" {
}

variable "nexus_maven_central_s3_bucket" {
}

variable "nexus_docker_private_s3_bucket" {
}

variable "nexus_docker_hub_s3_bucket" {
}

variable "nexus_docker_group_s3_bucket" {
}