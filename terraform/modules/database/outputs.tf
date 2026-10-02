output "mysql_fqdn" { value = aws_db_instance.mysql.address }
output "mysql_port" { value = aws_db_instance.mysql.port }
output "mysql_endpoint" { value = aws_db_instance.mysql.endpoint }
