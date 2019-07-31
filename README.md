# terraform-nexus-module

# terraform-gitlab-module

This module assumes following resources are already available:
1. VPC
2. Public Subnet
3. Private Subnet
4. Route table, Route, Route Table Association for public subnet
5. Internet gateway for public subnet
6. Registered Domain Name
7. Route53 Hosted Zone

and it creates following resources:

1. Gitlab Instance
2. ALB for Nexus
3. Certificate for Nexus instance
4. IAM user 
5. SSH Key Pair
6. KMS Key
7. Route53 entry
8. S3 Buckets
9. Security Groups
10. Bastion Host

Usage:
```
module "nexus" {
      source                            = "../module/"
      vpc_id                            = var.vpc_id
      namespace                         = "eg"
      name                              = "app"
      stage                             = "test"
      attributes                        = ["xyz"]
      private_subnet_id                 = var.private_subnet_id
      public_subnet_id1                 = var.public_subnet_id1
      public_subnet_id2                 = var.public_subnet_id2
      domain_name                       = var.domain_name
      zone_id                           = var.zone_id
      ssh_key_name                      = var.ssh_key_name
      nexus_application_ami             = var.nexus_ami
      nexus_kms_alias                   = var.nexus_kms_alias
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
| private_subnet_id                 | Private subnet ID to attach                                                                                               | `string`| ""                 | yes      |
| vpc_id                            | Id of the VPC Gitlab will be provisioned in                                                                               | `string`| ""                 | yes      |
| nexus_data_disk_size              | Size of nexus data disk to provision                                                                                      | `number`| `10 `              | no       |
| nexus_data_device_name            | Name of nexus data disk                                                                                                   | `string`| `/dev/xvdi`        | no       |
| nexus_data_directory              | Location of nexus data disk                                                                                               | `string`| `/nexus/data`      | no       |
| snapshot_interval                 | How often this lifecycle policy should be evaluated                                                                       | `string`| `24`               | no       |
| snapshot_start_time               | List of times in 24 hour clock format that sets when the lifecycle policy should be evaluated                             | `string`| `00:00`            | no       |
| retain_rule                       | How many snapshots to keep. Must be an integer between 1 and 1000.                                                        | `number`| `10`               | no       |
| nexus_alb_ideal_timeout           | Time in seconds that the connection is allowed to be idle.                                                                | `number`| `60`               | no       |
| nexus_application_ami             | AMI of nexus application to be used with Nexus instance.                                                                  | `string`| ""                 | yes      |
| zone_id                           | ID of the hosted zone to contain Route53 record.                                                                          | `string`| ""                 | yes      |
| nexus_kms_alias                   | Display name of KMS Key alias. Name must start with the word `alias` followed by a forward slash                          | `string`| ""                 | yes      |
| enable_key_rotation               | Specifies whether key rotation is enabled                                                                                 | `bool`  | `true`             | no       |
| ssh_key_name                      | SSH key for ec2 ssh                                                                                                       | `string`| ""                 | yes      |

## OUTPUT VALUE NAMES

| Name                              | Description                                     | 
| ----------------------------------| ------------------------------------------------| 
| nexus_s3_secret_key               | Nexus S3 IAM User secret key                    | 
| nexus_s3_access_key               | Nexus S3 IAM User access key                    | 
| user_arn                          | Nexus S3 IAM User ARN                           | 
| sg_nexus_internal_ssh_name        | Security Group name for nexus internal SSH      | 
| sg_nexus_internal_ssh_ingress     | Security Group ingress Rules nexus internal SSH | 
| sg_nexus_external_ssh_name        | Security Group name for  nexus bastion          | 
| sg_nexus_external_ssh_ingress     | Security Group ingress rules for  nexus bastion | 
| sg_nexus_alb_name                 | Security Group name for nexus ALB               | 
| sg_nexus _alb_ingress             | Security Group ingress rules nexus ALB          | 
| sg_internal_nexus_name            | Security Group name for nexus instance          | 
| sg_internal_nexus_ingress         | Security Group ingress rules nexus instance     | 
| nexus_acm_cert_arn                | Nexus ACM Certificate ARN                       | 
| nexus_route53_cert_validation     | Nexus ALB Route53 FQDN                          | 
| nexus_route53_nexus_alb           | Route53 FQDN for Nexus instance                 | 
| nexus_bastion_public_eip          | EIP Address of Nexus Bastion Instance           | 
| nexus_private_ip                  | Private IP Address of Gitlab Instance           | 