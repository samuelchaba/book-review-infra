variable "application_name" {
  description = "Application name prefix"
  type        = string
}

variable "environment" {
  description = "Deployment environment such as dev, uat, or prod"
  type        = string
}

variable "aws_region" {
  description = "AWS region for the deployment"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for the two private database subnets"
  type        = list(string)
  default     = ["10.0.10.0/24", "10.0.11.0/24"]
}

variable "ssh_cidr" {
  description = "CIDR allowed to SSH to the EC2 instances"
  type        = string
  default     = "0.0.0.0/0"
}

variable "frontend_port" {
  description = "Port exposed by the frontend application"
  type        = number
  default     = 3000
}

variable "backend_port" {
  description = "Port exposed by the backend application"
  type        = number
  default     = 3001
}

variable "database_port" {
  description = "MySQL port"
  type        = number
  default     = 3306
}

variable "admin_username" {
  description = "Linux username for EC2"
  type        = string
  default     = "ubuntu"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "mysql_admin_username" {
  description = "RDS MySQL administrator username"
  type        = string
}

variable "mysql_admin_password" {
  description = "RDS MySQL administrator password"
  type        = string
  sensitive   = true
}

variable "mysql_database_name" {
  description = "Initial MySQL database name"
  type        = string
}

variable "mysql_engine_version" {
  description = "RDS MySQL engine version"
  type        = string
  default     = "8.0"
}

variable "ssh_public_key" {
  description = "Path to the SSH public key used for the EC2 key pair"
  type        = string
}
