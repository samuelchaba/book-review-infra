module "network" {
  source = "./modules/network"

  application_name = var.application_name
  environment      = var.environment

  vpc_cidr             = var.vpc_cidr
  public_subnet_cidr   = var.public_subnet_cidr
  private_subnet_cidrs = var.private_subnet_cidrs

  ssh_cidr       = var.ssh_cidr
  frontend_port  = var.frontend_port
  backend_port   = var.backend_port
  database_port  = var.database_port
}

module "compute" {
  source = "./modules/compute"

  application_name = var.application_name
  environment      = var.environment

  instance_type    = var.instance_type
  admin_username   = var.admin_username
  ssh_public_key   = var.ssh_public_key
  public_subnet_id = module.network.public_subnet_id

  frontend_security_group_id = module.network.frontend_security_group_id
  backend_security_group_id  = module.network.backend_security_group_id
}

module "database" {
  source = "./modules/database"

  application_name = var.application_name
  environment      = var.environment

  mysql_admin_username = var.mysql_admin_username
  mysql_admin_password = var.mysql_admin_password
  mysql_database_name  = var.mysql_database_name
  mysql_engine_version = var.mysql_engine_version

  private_subnet_ids       = module.network.private_subnet_ids
  database_security_group_id = module.network.database_security_group_id

  depends_on = [module.compute]
}
