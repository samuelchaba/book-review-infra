variable "application_name" { type = string }
variable "environment" { type = string }
variable "mysql_admin_username" { type = string }
variable "mysql_admin_password" {
  type      = string
  sensitive = true
}
variable "mysql_database_name" { type = string }
variable "mysql_engine_version" { type = string }
variable "mysql_instance_class" {
  type    = string
  default = "db.t3.micro"
}
variable "private_subnet_ids" { type = list(string) }
variable "database_security_group_id" { type = string }
