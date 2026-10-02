output "frontend_public_ip" {
  description = "Public IP address of the frontend EC2 instance"
  value       = module.compute.frontend_public_ip
}

output "backend_public_ip" {
  description = "Public IP address of the backend EC2 instance"
  value       = module.compute.backend_public_ip
}

output "mysql_fqdn" {
  description = "RDS MySQL endpoint"
  value       = module.database.mysql_fqdn
}

output "mysql_port" {
  description = "RDS MySQL port"
  value       = module.database.mysql_port
}

output "vpc_id" {
  description = "VPC ID"
  value       = module.network.vpc_id
}
