module "network" {
  source = "./modules/network"

  vpc_cidr                = var.vpc_cidr
  public_subnet_cidr      = var.public_subnet_cidr
  private_app_subnet_cidr = var.private_app_subnet_cidr
  private_db_subnet_cidr  = var.private_db_subnet_cidr

  public_availability_zone      = var.public_availability_zone
  private_app_availability_zone = var.private_app_availability_zone
  private_db_availability_zone  = var.private_db_availability_zone
}



module "security" {
  source = "./modules/security"

  project_name = var.project_name
  vpc_id       = module.network.vpc_id
}



module "compute"{

  source = "./modules/compute"

  public_subnet_id = module.network.public_subnet_id
  private_app_subnet_id = module.network.private_app_subnet_id
  private_db_subnet_id = module.network.private_db_subnet_id


  frontend_sg_id = module.security.frontend_sg_id
  backend_sg_id = module.security.backend_sg_id
  db_sg_id = module.security.db_sg_id
  

}
