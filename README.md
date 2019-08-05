# terraform-nexus-module

This module assumes following resources are already available:
1. VPC
2. Public Subnet
3. Private Subnet
4. Route table, Route, Route Table Association for public subnet
5. Internet gateway for public subnet
6. Registered Domain Name
7. Route53 Hosted Zone
8. Certificate for Registered Domain Name 

and it creates following resources:

1. Nexus Instance
2. ALB for Nexus and Docker registry
3. IAM user for Nexus Blob stores
4. KMS Key for EBS encryption
5. Route53 entry for Nexus and Docker Registry
6. S3 Buckets for Nexus Blob stores
7. Security Groups
8. Bastion Host

*NOTE*: 
1. Initial nexus admin password is stored in `docker-container/nexus-data/admin.password`, you will have to `exec` into docker container in AWS instance.
Steps:
    - Store your SSH key in system's SSH-key store (`ssh-add -K keyname`).
    - SSH into nexus ec2 instance using bastion host (`ssh -A -t centos@{public-ip-bastion ssh centos@private-ip-nexus`).
    - Exec into running docker container (`docker exec -it nexus sh`).
    - Fetch admin password (`cat /nexus-data/admin.password`).
    - You can then use this password to login to your Nexus UI and reset password.
2. This module creates S3 buckets for Maven, NPM and Docker registries which can be registered as blob stores in nexus instance. 

Usage:
```
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
```

## INPUT VALUES

| Input                             | Description                                                                                                               | Type    | Default            | Required |
| ----------------------------------| --------------------------------------------------------------------------------------------------------------------------| --------|--------------------|----------|
| namespace                         | Namespace, which could be your organization name or abbreviation"                                                         | `string`| ""                 | yes      |
| stage                             | Stage, e.g. 'prod', 'staging', 'dev'                                                                                      | `string`| ""                 | yes      |
| name                              | Solution name, e.g. 'app' or 'jenkins'                                                                                    | `string`| ""                 | yes      |
| attributes                        | Additional attributes                                                                                                     | `list`  | `<list>`           | no       |           
| delimiter                         | Delimiter to be used between namespace, environment, stage, name and attributes                                           | `string`| "-"                | no       |
| force_destroy_s3_bucket           | Boolean that indicates all objects should be deleted from the bucket so that the bucket can be destroyed without error.   | `bool`  | `false`            | no       |
| domain_name                       | ALB record53 entry domain name                                                                                            | `string`| ""                 | yes      |
| public_subnet_id1                 | Public subnet ID to attach                                                                                                | `string`| ""                 | yes      |
| public_subnet_id2                 | Public subnet ID to attach                                                                                                | `string`| ""                 | yes      |
| private_subnet_id1                | Private subnet ID to attach                                                                                               | `string`| ""                 | yes      |
| private_subnet_id2                | Private subnet ID to attach                                                                                               | `string`| ""                 | yes      |
| vpc_id                            | Id of the VPC Gitlab will be provisioned in                                                                               | `string`| ""                 | yes      |
| nexus_data_disk_size              | Size of nexus data disk to provision                                                                                      | `number`| `10 `              | no       |
| nexus_data_device_name            | Name of nexus data disk                                                                                                   | `string`| `/dev/xvdi`        | no       |
| nexus_data_directory              | Location of nexus data disk                                                                                               | `string`| `/nexus/data`      | no       |
| nexus_alb_ideal_timeout           | Time in seconds that the connection is allowed to be idle.                                                                | `number`| `60`               | no       |
| nexus_application_ami             | AMI of nexus application to be used with Nexus instance.                                                                  | `string`| ""                 | yes      |
| zone_id                           | ID of the hosted zone to contain Route53 record.                                                                          | `string`| ""                 | yes      |
| nexus_kms_alias                   | Display name of KMS Key alias. Name must start with the word `alias` followed by a forward slash                          | `string`| ""                 | yes      |
| enable_key_rotation               | Specifies whether key rotation is enabled                                                                                 | `bool`  | `true`             | no       |
| ssh_key_name                      | SSH key for ec2 ssh                                                                                                       | `string`| ""                 | yes      |
| nexus_npm_registry_s3_bucket      | Name of Nexus NPM Registry S3 bucket                                                                                      | `string`| ""                 | yes      |
| nexus_npm_private_s3_bucket       | Name of Nexus NPM Private S3 bucket                                                                                       | `string`| ""                 | yes      |
| nexus_npm_group_s3_bucket         | Name of Nexus NPM Group S3 bucket                                                                                         | `string`| ""                 | yes      |
| nexus_maven_snapshots_s3_bucket   | Name of Nexus Maven Snapshots S3 bucket                                                                                   | `string`| ""                 | yes      |
| nexus_maven_releases_s3_bucket    | Name of Nexus Maven Releases S3 bucket                                                                                    | `string`| ""                 | yes      |
| nexus_maven_group_s3_bucket       | Name of Nexus Maven Group S3 bucket                                                                                       | `string`| ""                 | yes      |
| nexus_maven_central_s3_bucket     | Name of Nexus Maven Central S3 bucket                                                                                     | `string`| ""                 | yes      |
| nexus_docker_private_s3_bucket    | Name of Nexus Docker Private S3 bucket                                                                                    | `string`| ""                 | yes      |
| nexus_docker_hub_s3_bucket        | Name of Nexus Docker Hub S3 bucket                                                                                        | `string`| ""                 | yes      |
| nexus_docker_group_s3_bucket      | Name of Nexus Docker Group S3 bucket                                                                                      | `string`| ""                 | yes      |



## OUTPUT VALUE NAMES

| Name                                 | Description                                     | 
| -------------------------------------| ------------------------------------------------| 
| nexus_s3_secret_key                  | Nexus S3 IAM User secret key                    | 
| nexus_s3_access_key                  | Nexus S3 IAM User access key                    | 
| user_arn                             | Nexus S3 IAM User ARN                           | 
| sg_nexus_internal_ssh_name           | Security Group name for nexus internal SSH      | 
| sg_nexus_internal_ssh_ingress        | Security Group ingress Rules nexus internal SSH | 
| sg_nexus_external_ssh_name           | Security Group name for  nexus bastion          | 
| sg_nexus_external_ssh_ingress        | Security Group ingress rules for  nexus bastion | 
| sg_nexus_alb_name                    | Security Group name for nexus ALB               | 
| sg_nexus _alb_ingress                | Security Group ingress rules nexus ALB          | 
| sg_internal_nexus_name               | Security Group name for nexus instance          | 
| sg_internal_nexus_ingress            | Security Group ingress rules nexus instance     | 
| nexus_acm_cert_arn                   | Nexus ACM Certificate ARN                       | 
| nexus_route53_cert_validation        | Nexus ALB Route53 FQDN                          | 
| nexus_route53_nexus_alb              | Route53 FQDN for Nexus instance                 | 
| nexus_bastion_public_eip             | EIP Address of Nexus Bastion Instance           | 
| nexus_private_ip                     | Private IP Address of Gitlab Instance           | 
| nexus_npm_registry_s3_bucket_name    | Name of Nexus NPM Registry S3 bucket            | 
| nexus_npm_private_s3_bucket_name     | Name of Nexus NPM Private S3 bucket             | 
| nexus_npm_group_s3_bucket_name       | Name of Nexus NPM Group S3 bucket               | 
| nexus_maven_snapshots_s3_bucket_name | Name of Nexus Maven Snapshots S3 bucke          | 
| nexus_maven_releases_s3_bucket_name  | Name of Nexus Maven Releases S3 bucket          | 
| nexus_maven_group_s3_bucket_name     | Name of Nexus Maven Group S3 bucket             | 
| nexus_maven_central_s3_bucket_name   | Name of Nexus Maven Central S3 bucket           | 
| nexus_docker_hub_s3_bucket_name_name | Name of Nexus Docker Hub S3 bucket              | 
| nexus_docker_group_s3_bucket_name    | Name of Nexus Docker Group S3 bucket            | 
| nexus_docker_private_s3_bucket_name  | Name of Nexus Docker Private S3 bucket          | 
