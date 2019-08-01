variable "namespace" {
  type        = string
  description = "Namespace, which could be your organization name or abbreviation, e.g. 'eg' or 'cp'"
  default     = ""
}

variable "stage" {
  type        = string
  description = "Stage, e.g. 'prod', 'staging', 'dev', OR 'source', 'build', 'test', 'deploy', 'release'"
  default     = ""
}

variable "attributes" {
  type        = list
  description = "Additional attributes (e.g. 1)"
  default     = []
}

variable "delimiter" {
  type        = string
  description = "Delimiter to be used between namespace, environment, stage, name and attributes"
  default     = "-"
}

variable "name" {
  type        = "string"
  description = "A prefix to add to project resources"
  default     = ""
}

variable "dns_name" {
  type        = string
  description = "AWS account cert dns address"
  default     = ""
}

variable "registry_domain_name" {
  type        = string
  description = "ALB record53 entry registry domain name"
  default     = ""
}

variable "docker_domain_name" {
  type        = string
  description = "ALB record53 entry docker domain name"
  default     = ""
}

variable "public_subnet_id1" {
  type        = string
  description = "Public subnet ID to attach"
}

variable "public_subnet_id2" {
  type        = string
  description = "Public subnet ID to attach"
}

variable "private_subnet_id1" {
  type        = string
  description = "Private subnet ID to attach"
}

variable "private_subnet_id2" {
  type        = string
  description = "Private subnet ID to attach"
}

variable "vpc_id" {
  type        = string
  description = "Id of the VPC nexus will be provisioned in."
  default     = ""
}

variable "nexus_data_disk_size" {
  description = "The size of nexus data disk to provision"
  default     = 10
}

variable "nexus_data_device_name" {
  type        = string
  description = "The name nexus data disk"
  default     = "/dev/sda2"
}

variable "nexus_data_directory" {
  type     = string
  default  = "/nexus-data"
}

variable "nexus_alb_ideal_timeout" {
  description = "The time in seconds that the connection is allowed to be idle."
  default     = 60
}

variable "rotation_status" {
  type        = string
  description = "Rotation status for S3 IAM user, 0 or 1"
  default     = "1"
}

variable "nexus_application_ami" {
  type        = string
  description = "AMI of nexus application to be used with nexus instance. AMI can be build using Packer like: https://github.com/university-outreach-infrastructure-tf/nexus-packer-ami"
  default     = ""
}

variable "zone_id" {
  type        = string
  description = "The ID of the hosted zone to contain Route53 record."
  default     = ""
}

variable "nexus_kms_alias" {
  type        = string
  description = "The display name of the alias. The name must start with the word `alias` followed by a forward slash"
  default     = ""
}

variable "enable_key_rotation" {
  description = "Specifies whether key rotation is enabled"
  default     = true
}

variable "ssh_key_name"{
  type        = string
  description = "SSH key for ec2 ssh"
  default     = ""
}

variable "force_destroy_s3_bucket" {
  description = "A boolean that indicates all objects should be deleted from the bucket so that the bucket can be destroyed without error. These objects are not recoverable"
  default     =  false
}

variable "nexus_docker_hosted_s3_bucket_name" {
  type        = string
  description = "S3 bucket name"
  default     = ""
}

variable "nexus_npm_registry_s3_bucket" {
  type        = string
  description = "Name of Nexus NPM Registry S3 bucket"
  default     = ""
}

variable "nexus_npm_private_s3_bucket" {
  type        = string
  description = "Name of Nexus NPM Private S3 bucket"
  default     = ""
}

variable "nexus_npm_group_s3_bucket" {
  type        = string
  description = "Name of Nexus NPM Group S3 bucket"
  default     = ""
}

variable "nexus_maven_snapshots_s3_bucket" {
  type        = string
  description = "Name of Nexus Maven Snapshots S3 bucket"
  default     = ""
}
variable "nexus_maven_releases_s3_bucket" {
  type        = string
  description = "Name of Nexus Maven Releases S3 bucket"
  default     = ""
}

variable "nexus_maven_group_s3_bucket" {
  type        = string
  description = "Name of Nexus Maven Group S3 bucket"
  default     = ""
}

variable "nexus_maven_central_s3_bucket" {
  type        = string
  description = "Name of Nexus Maven Central S3 bucket"
  default     = ""
}

variable "nexus_docker_private_s3_bucket" {
  type        = string
  description = "Name of Nexus Docker Private S3 bucket"
  default     = ""
}

variable "nexus_docker_hub_s3_bucket_name" {
  type        = string
  description = "Name of Nexus Docker Hub S3 bucket"
  default     = ""
}

variable "nexus_docker_group_s3_bucket" {
  type        = string
  description = "Name of Nexus Docker Group S3 bucket"
  default     = ""
}