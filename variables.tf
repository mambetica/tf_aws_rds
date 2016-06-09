variable "cluster_identifier" {
  description = "The Cluster Identifier. Must be a lower case string"
}
variable "master_username" {
  description = "Username for the master DB user"
}
variable "master_password" {
  description = "Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file"
}
variable "availability_zones" {
  description = "A list of EC2 Availability Zones that instances in the DB cluster can be created in"
}
variable "database_name" {
  description = "The name for your database of up to 8 alpha-numeric characters. If you do not provide a name, Amazon RDS will not create a database in the DB cluster you are creating"
}
variable "backup_retention_period" {
  description = "The days to retain backups for. Default 1"
  default = 1
}
variable "preferred_backup_window" {
  description = "The daily time range during which automated backups are created if automated backups are enabled using the BackupRetentionPeriod parameter. Default: A 30-minute window selected at random from an 8-hour block of time per region. e.g. 04:00-09:00"
  default = "07:00-09:00"
}
variable "vpc_security_group_ids" {
  description = "List of VPC security groups to associate with the Cluster"
}
variable "storage_encrypted" {
  description = "Specifies whether the DB cluster is encrypted. The default is false if not specified"
  default = false
}
variable "apply_immediately" {
  description = "Specifies whether any cluster modifications are applied immediately, or during the next maintenance window. Default is false. See Amazon RDS Documentation for more information."
  default = false
}