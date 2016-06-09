resource "aws_rds_cluster" "rds" {
  cluster_identifier = "${var.cluster_identifier}"
  availability_zones = ["${split(",", var.availability_zones)}"]
  database_name = "${var.database_name}"
  master_username = "${var.master_username}"
  master_password = "${var.master_password}"
  backup_retention_period = "${var.backup_retention_period}"
  preferred_backup_window = "${var.preferred_backup_window}"
  vpc_security_group_ids = ["${split(",", var.vpc_security_group_ids)}"]
  storage_encrypted = "${storage_encrypted}"
  apply_immediately = "${apply_immediately}"
}