application_name = "bookreview"
environment = "prod"
aws_region = "ap-south-1"

vpc_cidr = "10.0.0.0/16"
public_subnet_cidr = "10.0.1.0/24"
private_subnet_cidrs = ["10.0.10.0/24", "10.0.11.0/24"]

ssh_cidr = "0.0.0.0/0"
frontend_port = 3000
backend_port = 3001
database_port = 3306

admin_username = "ubuntu"
instance_type = "t3.micro"

mysql_admin_username = "mysqladmin"
mysql_database_name = "bookreviews_prod"
mysql_engine_version = "8.0"

# SSH public key is supplied securely by the Azure DevOps pipeline.
# Supply the MySQL password securely with TF_VAR_mysql_admin_password.
