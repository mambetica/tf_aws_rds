Terraform AWS RDS Module
===========

A Terraform module to create the following resources within AWS:

- Relational Database Service (RDS)

Input Variables
---------------

- `cluster_identifier` - (Mandatory) The Cluster Identifier. Must be a lower case string
- `master_username` - (Mandatory) Username for the master DB user
- `master_password` - (Mandatory) Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file
- `availability_zones` - (Optional) A list of EC2 Availability Zones that instances in the DB cluster can be created in
- `database_name` - (Optional) The name for your database of up to 8 alpha-numeric characters. If you do not provide a name, Amazon RDS will not create a database in the DB cluster you are creating
- `backup_retention_period` - (Optional) The days to retain backups for. Default is 1
- `preferred_backup_window` - (Optional) The daily time range during which automated backups are created if automated backups are enabled using the BackupRetentionPeriod parameter. Default: A 30-minute window selected at random from an 8-hour block of time per region. e.g. 04:00-09:00
- `vpc_security_group_ids` - (Optional) List of VPC security groups to associate with the Cluster
- `storage_encrypted` - (Optional) Specifies whether the DB cluster is encrypted. The default is false if not specified
- `apply_immediately` - (Optional) Specifies whether any cluster modifications are applied immediately, or during the next maintenance window. Default is false

Output Variables
----------------

- None defined

Usage
-----

```
variable "cluster_identifier" { default = "cluster-id" }
variable "availability_zones" { default = "region-1a,region-1b,region-1c" }
variable "database_name" { default = "my_database" }
variable "master_username" { default = "username" }
variable "master_password" { default = "password" }
variable "backup_retention_period" { default = 5 }
variable "preferred_backup_window" { default = "07:00-09:00" }

module "my_rds" {
  source = "github.com/mambetica/tf_aws_rds"
  cluster_identifier = "${var.cluster_identifier}"
  availability_zones = ["${split(",", var.availability_zones)}"]
  database_name = "${var.database_name}"
  master_username = "${var.master_username}"
  master_password = "${var.master_password}"
  backup_retention_period = "${var.backup_retention_period}"
  preferred_backup_window = "${var.preferred_backup_window}"
}
```