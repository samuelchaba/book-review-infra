application_name = "bookreview"
environment = "dev"
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
mysql_database_name = "bookreviews_dev"
mysql_engine_version = "8.0"

# SSH public key and MySQL password are supplied securely at runtime.
