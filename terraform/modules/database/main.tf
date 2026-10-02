resource "aws_db_subnet_group" "mysql" {
  name       = "${var.application_name}-${var.environment}-mysql-subnets"
  subnet_ids = var.private_subnet_ids
}

resource "aws_db_instance" "mysql" {
  identifier             = "${var.application_name}-${var.environment}-mysql"
  engine                 = "mysql"
  engine_version         = var.mysql_engine_version
  instance_class         = var.mysql_instance_class
  allocated_storage      = 20
  storage_type           = "gp3"
  storage_encrypted      = true
  db_name                = var.mysql_database_name
  username               = var.mysql_admin_username
  password               = var.mysql_admin_password
  port                   = 3306
  db_subnet_group_name   = aws_db_subnet_group.mysql.name
  vpc_security_group_ids = [var.database_security_group_id]
  publicly_accessible    = false
  multi_az               = false
  backup_retention_period = 0
  deletion_protection    = false
  skip_final_snapshot    = true
}
