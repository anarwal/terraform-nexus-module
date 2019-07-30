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
  description = "A domain name for which the certificate should be issued"
  default     = ""
}

variable "domain_name" {
  type        = string
  description = "ALB record53 entry domain name"
  default     = ""
}

variable "public_subnet_id" {
  type        = list
  description = "A list of public subnet IDs to attach"
  default     = []
}

variable "private_subnet_id" {
  type        = list
  description = "A list of private subnet IDs to attach"
  default     = []
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
  default     = "/dev/xvdi"
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